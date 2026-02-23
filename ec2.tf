resource "aws_security_group" "ec2_sg" {
  name        = "${var.instance_name}-sg"
  description = "Security group for ${var.instance_name}"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.instance_name}-sg"
    Environment = var.environment
  }
}

resource "aws_instance" "main" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name        = var.instance_name
    Environment = var.environment
    OwnedBy     = "Alice"
    CreatedBy   = "Alice"
    ManagedBy   = "Harness"
    AppliedBy   = "TerraForm"
    Date        = "2/23/2026"
    Intent      = "Testing"
    OSType      = "Amazon Linux"
    OSVersion   = "2023"
    OSKernel    = "Kernel 6"
    Date        = "23/2/2026"
    TimeZone    = "EST"
    JunkTag01   = "I just need to update this to force a run again"
    JunkTag02   = "See JunkTag01"
    JunkTag03   = "See JunkTag01 and 2"

  }
}
