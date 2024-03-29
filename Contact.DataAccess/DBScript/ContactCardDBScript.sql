CREATE DATABASE [ContactBusinessCard]
USE [ContactBusinessCard]
GO
/****** Object:  Table [dbo].[address]    Script Date: 8/7/2019 12:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] NOT NULL,
	[address_type] [uniqueidentifier] NULL,
	[street] [varchar](255) NULL,
	[street_2] [varchar](255) NULL,
	[state_id] [int] NULL,
	[pincode] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressType]    Script Date: 8/7/2019 12:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressType](
	[AddressTypeID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 8/7/2019 12:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[code] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[organisation]    Script Date: 8/7/2019 12:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[organisation](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[slogan_id] [int] NULL,
	[address_id] [int] NULL,
	[contact_no] [varchar](1) NULL,
	[email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[position]    Script Date: 8/7/2019 12:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[organisation_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slogan]    Script Date: 8/7/2019 12:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slogan](
	[id] [int] NOT NULL,
	[message] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 8/7/2019 12:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[country_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 8/7/2019 12:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[position_id] [int] NULL,
	[organisation_id] [int] NULL,
	[address_id] [int] NULL,
	[mob_no] [varchar](255) NULL,
	[alt_mob_no] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[address] ([id], [address_type], [street], [street_2], [state_id], [pincode]) VALUES (1, N'6411641c-f93c-4923-8d28-21fd0f36add6', N'Delhi', N'Delhi', 1, N'12234')
INSERT [dbo].[address] ([id], [address_type], [street], [street_2], [state_id], [pincode]) VALUES (5, N'6411641c-f93c-4923-8d28-21fd0f36add6', N'asasasa', N'asasa', 1, N'121212')
INSERT [dbo].[address] ([id], [address_type], [street], [street_2], [state_id], [pincode]) VALUES (6, N'6411641c-f93c-4923-8d28-21fd0f36add6', N'asasasa', N'asasa', 1, N'121212')
INSERT [dbo].[AddressType] ([AddressTypeID], [Name]) VALUES (N'6411641c-f93c-4923-8d28-21fd0f36add6', N'Organisation')
INSERT [dbo].[AddressType] ([AddressTypeID], [Name]) VALUES (N'5d4a13fb-58c9-443f-9cd3-30e0e2f4f407', N'Residential')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (1, N'Afghanistan', N'AFG')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (2, N'Aland Islands', N'ALA')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (3, N'Albania', N'ALB')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (4, N'Algeria', N'DZA')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (5, N'American Samoa', N'ASM')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (6, N'Andorra', N'AND')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (7, N'Angola', N'AGO')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (8, N'Anguilla', N'AIA')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (9, N'Antarctica', N'ATA')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (10, N'Antigua and Barbuda', N'ATG')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (11, N'Argentina', N'ARG')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (12, N'Armenia', N'ARM')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (13, N'Aruba', N'ABW')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (14, N'Australia', N'AUS')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (15, N'Austria', N'AUT')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (16, N'Azerbaijan', N'AZE')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (17, N'Bahamas', N'BHS')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (18, N'Bahrain', N'BHR')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (19, N'Bangladesh', N'BGD')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (20, N'Barbados', N'BRB')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (21, N'Belarus', N'BLR')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (22, N'Belgium', N'BEL')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (23, N'Belize', N'BLZ')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (24, N'Benin', N'BEN')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (25, N'Bermuda', N'BMU')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (26, N'Bhutan', N'BTN')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (27, N'Bolivia', N'BOL')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (28, N'Bonaire, Sint Eustatius and Saba', N'BES')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (29, N'Bosnia and Herzegovina', N'BIH')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (30, N'Botswana', N'BWA')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (31, N'Bouvet Island', N'BVT')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (32, N'Brazil', N'BRA')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (33, N'British Indian Ocean Territory', N'IOT')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (34, N'Brunei', N'BRN')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (35, N'Bulgaria', N'BGR')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (36, N'Burkina Faso', N'BFA')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (37, N'Burundi', N'BDI')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (38, N'Cambodia', N'KHM')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (39, N'Cameroon', N'CMR')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (40, N'Canada', N'CAN')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (41, N'Cape Verde', N'CPV')
INSERT [dbo].[country] ([id], [name], [code]) VALUES (102, N'India', N'IND')
INSERT [dbo].[organisation] ([id], [name], [slogan_id], [address_id], [contact_no], [email]) VALUES (1, N'Global Logic', 1, NULL, N'1', N'h@gmail.com')
INSERT [dbo].[position] ([id], [name], [organisation_id]) VALUES (1, N'Manager', 1)
INSERT [dbo].[position] ([id], [name], [organisation_id]) VALUES (2, N'Lead', 1)
INSERT [dbo].[slogan] ([id], [message]) VALUES (1, N'We are Good')
INSERT [dbo].[state] ([id], [name], [country_id]) VALUES (1, N'Uttar Pradesh', 102)
INSERT [dbo].[state] ([id], [name], [country_id]) VALUES (2, N'Andhra Pradesh', 102)
INSERT [dbo].[state] ([id], [name], [country_id]) VALUES (3, N'Arunachal Pradesh', 102)
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [first_name], [last_name], [position_id], [organisation_id], [address_id], [mob_no], [alt_mob_no], [email], [isDeleted]) VALUES (1, N'Pranab', N'Nayak', 1, 1, 1, N'987654579', N'9089989999', N'p@gmail.com', 0)
INSERT [dbo].[user] ([id], [first_name], [last_name], [position_id], [organisation_id], [address_id], [mob_no], [alt_mob_no], [email], [isDeleted]) VALUES (2, N'Hemant', N'Garg', 1, 1, 1, N'987654578', N'9089989678', N'hemant@gmail.com', 0)
INSERT [dbo].[user] ([id], [first_name], [last_name], [position_id], [organisation_id], [address_id], [mob_no], [alt_mob_no], [email], [isDeleted]) VALUES (3, N'Mamta', N'Gupta', 1, 1, 1, N'8909878766', N'345562323', N'Mamta.gupta@gmail.com', 1)
INSERT [dbo].[user] ([id], [first_name], [last_name], [position_id], [organisation_id], [address_id], [mob_no], [alt_mob_no], [email], [isDeleted]) VALUES (4, N'Mamta', N'Gupta', 1, 1, 1, N'8909878766', N'345562323', N'Mamta.gupta@gmail.com', 0)
INSERT [dbo].[user] ([id], [first_name], [last_name], [position_id], [organisation_id], [address_id], [mob_no], [alt_mob_no], [email], [isDeleted]) VALUES (5, N'Kunal', N'Goel', 1, 1, 1, N'8909', N'3455', N'KG@gmail.com', 0)
INSERT [dbo].[user] ([id], [first_name], [last_name], [position_id], [organisation_id], [address_id], [mob_no], [alt_mob_no], [email], [isDeleted]) VALUES (6, N'Mamta', N'Gupta', 1, 1, 1, N'8909878766', N'345562323', N'Mamta.gupta@gmail.com', 0)
INSERT [dbo].[user] ([id], [first_name], [last_name], [position_id], [organisation_id], [address_id], [mob_no], [alt_mob_no], [email], [isDeleted]) VALUES (7, N'Pradeeep34545', N'Gupta', 1, 1, 1, N'987656767', N'675785', N'pradeep@gmail.com', 0)
INSERT [dbo].[user] ([id], [first_name], [last_name], [position_id], [organisation_id], [address_id], [mob_no], [alt_mob_no], [email], [isDeleted]) VALUES (8, N'Nishant', N'Bansal', 1, 1, 5, N'454545', N'454545', N'string', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [position_id], [organisation_id], [address_id], [mob_no], [alt_mob_no], [email], [isDeleted]) VALUES (9, N'Nishant', N'Bansal', 1, 1, 1, N'454545', N'454545', N'string', 0)
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[address]  WITH CHECK ADD FOREIGN KEY([address_type])
REFERENCES [dbo].[AddressType] ([AddressTypeID])
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD FOREIGN KEY([state_id])
REFERENCES [dbo].[state] ([id])
GO
ALTER TABLE [dbo].[organisation]  WITH CHECK ADD FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[organisation]  WITH CHECK ADD FOREIGN KEY([slogan_id])
REFERENCES [dbo].[slogan] ([id])
GO
ALTER TABLE [dbo].[position]  WITH CHECK ADD FOREIGN KEY([organisation_id])
REFERENCES [dbo].[organisation] ([id])
GO
ALTER TABLE [dbo].[state]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([organisation_id])
REFERENCES [dbo].[organisation] ([id])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([id])
GO
USE [master]
GO
ALTER DATABASE [ContactBusinessCard] SET  READ_WRITE 
GO
