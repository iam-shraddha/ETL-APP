#######################################
# SECURITY GROUPS FOR ALL COMPONENTS
#######################################

############################
# CORE INSTANCE SG
############################
resource "aws_security_group" "core_sg" {
  name        = "hyp-minds-core-sg"
  description = "Security group for core EC2"
  vpc_id      = aws_vpc.this.id

  ingress = [
    {
      description      = "SSH from anywhere"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "hyp-minds-core-sg"
  }
}

############################
# ORCHESTRATOR SG
############################
resource "aws_security_group" "orch_sg" {
  name        = "hyp-minds-orch-sg"
  description = "Security group for Orchestrator EC2"
  vpc_id      = aws_vpc.this.id

  ingress = [
    {
      description      = "SSH access"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "FastAPI port"
      from_port        = 8000
      to_port          = 8000
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "hyp-minds-orch-sg"
  }
}

############################
# POSTGRES EC2 SG
############################
resource "aws_security_group" "pg_sg" {
  name        = "hyp-minds-pg-sg"
  description = "Security group for PostgreSQL EC2"
  vpc_id      = aws_vpc.this.id

  ingress = [
    {
      description      = "Allow DB connections"
      from_port        = 5432
      to_port          = 5432
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "hyp-minds-pg-sg"
  }
}

