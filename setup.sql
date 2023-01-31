/*
Enter custom T-SQL here that would run after SQL Server has started up. 
*/

CREATE DATABASE CTSDB;
GO

CREATE SCHEMA [CTS]
GO

CREATE TABLE [CTS].[Member] (
  [id] int PRIMARY KEY,
  [name] varchar(20),
  [age] nvarchar(3),
  [contactId] int,
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[Contact] (
  [id] int PRIMARY KEY,
  [phone] nvarchar(15),
  [addressLineOne] nvarchar(255),
  [addressLineTwo] nvarchar(255),
  [locationId] int,
  [email] nvarchar(50),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[Location] (
  [id] int PRIMARY KEY,
  [cityId] int,
  [stateId] int,
  [countryId] int,
  [pincode] nvarchar(10),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[Country] (
  [id] int PRIMARY KEY,
  [name] nvarchar(50),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[State] (
  [id] int PRIMARY KEY,
  [countryId] int,
  [name] nvarchar(50),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[City] (
  [id] int PRIMARY KEY,
  [stateId] int,
  [name] nvarchar(50),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[MemberRole_m] (
  [id] int PRIMARY KEY,
  [name] nvarchar(20),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[Toss_m] (
  [id] int PRIMARY KEY,
  [name] nvarchar(10),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[NonPlayer_mp] (
  [memberId] int,
  [memberRoleId] int,
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[Player_mp] (
  [memberId] int,
  [memberRoleId] int,
  [teamId] int,
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[Team] (
  [id] int PRIMARY KEY,
  [teamName] nvarchar(50),
  [clubId] int,
  [establishedDate] date
)
GO

CREATE TABLE [CTS].[Club] (
  [id] int PRIMARY KEY,
  [name] nvarchar(50),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[TossResults] (
  [matchId] int PRIMARY KEY,
  [tossChoiceId] int,
  [tossWonBy] int,
  [decision] nvarchar(10),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[Stadium] (
  [id] int PRIMARY KEY,
  [name] nvarchar(50),
  [contactId] int,
  [capacity] int,
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[MatchSummary] (
  [id] int PRIMARY KEY,
  [homeTeamId] int,
  [visitingTeamId] int,
  [wonBy] int,
  [firstUmpire] int,
  [secondUmpire] int,
  [thirdUmpire] int,
  [stadiumId] int,
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[Balls] (
  [id] int PRIMARY KEY,
  [matchId] int,
  [over] int,
  [ballNumber] int,
  [run] int,
  [isWide] bool,
  [isNoBall] bool,
  [wicketTypeId] int,
  [innings] int,
  [strikerId] int,
  [nonStricker] int,
  [bowler] nvarchar(255),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

CREATE TABLE [CTS].[WicketsType_m] (
  [id] int PRIMARY KEY,
  [name] nvarchar(20),
  [createdAt] datetime,
  [createdBy] int,
  [updatedAt] datetime,
  [updatedBy] int
)
GO

ALTER TABLE [CTS].[Member] ADD FOREIGN KEY ([contactId]) REFERENCES [CTS].[Contact] ([id])
GO

ALTER TABLE [CTS].[Contact] ADD FOREIGN KEY ([locationId]) REFERENCES [CTS].[Location] ([id])
GO

ALTER TABLE [CTS].[Location] ADD FOREIGN KEY ([cityId]) REFERENCES [CTS].[City] ([id])
GO

ALTER TABLE [CTS].[Location] ADD FOREIGN KEY ([stateId]) REFERENCES [CTS].[State] ([id])
GO

ALTER TABLE [CTS].[Location] ADD FOREIGN KEY ([countryId]) REFERENCES [CTS].[Country] ([id])
GO

ALTER TABLE [CTS].[State] ADD FOREIGN KEY ([countryId]) REFERENCES [CTS].[Country] ([id])
GO

ALTER TABLE [CTS].[City] ADD FOREIGN KEY ([stateId]) REFERENCES [CTS].[State] ([id])
GO

ALTER TABLE [CTS].[NonPlayer_mp] ADD FOREIGN KEY ([memberId]) REFERENCES [CTS].[Member] ([id])
GO

ALTER TABLE [CTS].[NonPlayer_mp] ADD FOREIGN KEY ([memberRoleId]) REFERENCES [CTS].[MemberRole_m] ([id])
GO

ALTER TABLE [CTS].[Player_mp] ADD FOREIGN KEY ([memberId]) REFERENCES [CTS].[Member] ([id])
GO

ALTER TABLE [CTS].[Player_mp] ADD FOREIGN KEY ([memberRoleId]) REFERENCES [CTS].[MemberRole_m] ([id])
GO

ALTER TABLE [CTS].[Player_mp] ADD FOREIGN KEY ([teamId]) REFERENCES [CTS].[Team] ([id])
GO

ALTER TABLE [CTS].[Team] ADD FOREIGN KEY ([clubId]) REFERENCES [CTS].[Club] ([id])
GO

ALTER TABLE [CTS].[TossResults] ADD FOREIGN KEY ([tossChoiceId]) REFERENCES [CTS].[Toss_m] ([id])
GO

ALTER TABLE [CTS].[MatchSummary] ADD FOREIGN KEY ([homeTeamId]) REFERENCES [CTS].[Team] ([id])
GO

ALTER TABLE [CTS].[MatchSummary] ADD FOREIGN KEY ([visitingTeamId]) REFERENCES [CTS].[Team] ([id])
GO

ALTER TABLE [CTS].[MatchSummary] ADD FOREIGN KEY ([wonBy]) REFERENCES [CTS].[Team] ([id])
GO

ALTER TABLE [CTS].[MatchSummary] ADD FOREIGN KEY ([firstUmpire]) REFERENCES [CTS].[Member] ([id])
GO

ALTER TABLE [CTS].[MatchSummary] ADD FOREIGN KEY ([secondUmpire]) REFERENCES [CTS].[Member] ([id])
GO

ALTER TABLE [CTS].[MatchSummary] ADD FOREIGN KEY ([thirdUmpire]) REFERENCES [CTS].[Member] ([id])
GO

ALTER TABLE [CTS].[MatchSummary] ADD FOREIGN KEY ([stadiumId]) REFERENCES [CTS].[Stadium] ([id])
GO

ALTER TABLE [CTS].[Balls] ADD FOREIGN KEY ([matchId]) REFERENCES [CTS].[MatchSummary] ([id])
GO

ALTER TABLE [CTS].[Balls] ADD FOREIGN KEY ([wicketTypeId]) REFERENCES [CTS].[WicketsType_m] ([id])
GO

ALTER TABLE [CTS].[Balls] ADD FOREIGN KEY ([strickerId]) REFERENCES [CTS].[Member] ([id])
GO

ALTER TABLE [CTS].[Balls] ADD FOREIGN KEY ([nonStrickerId]) REFERENCES [CTS].[Member] ([id])
GO

ALTER TABLE [CTS].[Balls] ADD FOREIGN KEY ([bowlerId]) REFERENCES [CTS].[Member] ([id])
GO
