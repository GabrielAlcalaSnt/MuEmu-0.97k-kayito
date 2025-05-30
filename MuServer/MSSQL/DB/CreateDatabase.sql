-- ----------------------------------------------------------------------------
-- DATABASE MuOnline97
-- ----------------------------------------------------------------------------
PRINT 'Creating Database MuOnline97...'
GO
CREATE DATABASE MuOnline97
GO

USE MuOnline97
PRINT 'Now using Database MuOnline97.'
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET ARITHABORT ON
GO

-- ----------------------------------------------------------------------------
-- Table AccountCharacter
-- ----------------------------------------------------------------------------
PRINT 'Creating table AccountCharacter...'
GO
CREATE TABLE [AccountCharacter] (
	[Id] VARCHAR(10) NOT NULL,
	[GameID1] VARCHAR(10) NULL,
	[GameID2] VARCHAR(10) NULL,
	[GameID3] VARCHAR(10) NULL,
	[GameID4] VARCHAR(10) NULL,
	[GameID5] VARCHAR(10) NULL,
	[GameIDC] VARCHAR(10) NULL,
	CONSTRAINT PK_AccountCharacter PRIMARY KEY ([Id])
)
GO

-- ----------------------------------------------------------------------------
-- Table Character
-- ----------------------------------------------------------------------------
PRINT 'Creating table Character...'
GO
CREATE TABLE [Character] (
	[AccountID] VARCHAR(10) NOT NULL,
	[Name] VARCHAR(10) NOT NULL,
	[ResetCount] INT NOT NULL DEFAULT 0,
	[GrandResetCount] INT NOT NULL DEFAULT 0,
	[cLevel] INT NOT NULL DEFAULT 1,
	[LevelUpPoint] INT NULL DEFAULT 0,
	[Class] TINYINT NULL,
	[Experience] INT NULL DEFAULT 0,
	[Strength] INT NULL,
	[Dexterity] INT NULL,
	[Vitality] INT NULL,
	[Energy] INT NULL,
	[Inventory] VARBINARY(760) NULL,
	[MagicList] VARBINARY(180) NULL,
	[Money] INT NULL DEFAULT 0,
	[Life] INT NULL,
	[MaxLife] INT NULL,
	[Mana] INT NULL,
	[MaxMana] INT NULL,
	[BP] INT NULL,
	[MaxBP] INT NULL,
	[MapNumber] TINYINT NULL,
	[MapPosX] TINYINT NULL,
	[MapPosY] TINYINT NULL,
	[MapDir] TINYINT NULL DEFAULT 0,
	[PkCount] INT NULL DEFAULT 0,
	[PkLevel] INT NULL DEFAULT 3,
	[PkTime] INT NULL DEFAULT 0,
	[CtlCode] TINYINT NULL DEFAULT 0,
	[Bloc_Expire] SMALLDATETIME NULL,
	[Quest] VARBINARY(50) NULL DEFAULT 0x00,
	[FruitPoint] INT NULL DEFAULT 0,
	[EffectList] VARBINARY(208) NULL,
	[FruitAddPoint] INT NOT NULL DEFAULT 0,
	[FruitSubPoint] INT NOT NULL DEFAULT 0,
	CONSTRAINT PK_Character PRIMARY KEY ([Name])
)
GO

-- ----------------------------------------------------------------------------
-- Table DefaultClassType
-- ----------------------------------------------------------------------------
PRINT 'Creating table DefaultClassType...'
GO
CREATE TABLE [DefaultClassType] (
	[Class] TINYINT NOT NULL,
	[Level] INT NULL DEFAULT 0,
	[LevelUpPoint] INT NULL DEFAULT 0,
	[Strength] INT NULL,
	[Dexterity] INT NULL,
	[Vitality] INT NULL,
	[Energy] INT NULL,
	[Inventory] VARBINARY(760) NULL,
	[MagicList] VARBINARY(180) NULL,
	[Life] INT NULL,
	[MaxLife] INT NULL,
	[Mana] INT NULL,
	[MaxMana] INT NULL,
	[MapNumber] TINYINT NULL,
	[MapPosX] TINYINT NULL,
	[MapPosY] TINYINT NULL,
	[Quest] VARBINARY(50) NULL,
	[EffectList] VARBINARY(208) NULL,
	CONSTRAINT PK_DefaultClassType PRIMARY KEY ([Class])
)
GO

-- ----------------------------------------------------------------------------
-- Table ExtWarehouse
-- ----------------------------------------------------------------------------
PRINT 'Creating table ExtWarehouse...'
GO
CREATE TABLE [ExtWarehouse] (
	[AccountID] VARCHAR(10) NOT NULL,
	[Number] INT NULL,
	[Items] VARBINARY(1920) NULL,
	[Money] INT NULL
)

CREATE INDEX IX_ExtWarehouse_AccountID ON ExtWarehouse (AccountID)
GO

-- ----------------------------------------------------------------------------
-- Table GameServerInfo
-- ----------------------------------------------------------------------------
PRINT 'Creating table GameServerInfo...'
GO
CREATE TABLE [GameServerInfo] (
	[Number] INT NOT NULL DEFAULT 0,
	[ItemCount] INT NOT NULL,
	CONSTRAINT PK_GameServerInfo PRIMARY KEY ([Number])
)
GO

-- ----------------------------------------------------------------------------
-- Table GoldenArcherCoin
-- ----------------------------------------------------------------------------
PRINT 'Creating table GoldenArcherCoin...'
GO
CREATE TABLE [GoldenArcherCoin] (
	[AccountID] VARCHAR(10) NOT NULL,
	[Renas] INT NOT NULL DEFAULT 0,
	[Stones] INT NOT NULL DEFAULT 0,
	[LuckyNumber] CHAR(12) NULL,
	CONSTRAINT PK_GoldenArcherCoin PRIMARY KEY ([AccountID])
)
GO

-- ----------------------------------------------------------------------------
-- Table GoldenArcherLuckyNumbers
-- ----------------------------------------------------------------------------
PRINT 'Creating table GoldenArcherLuckyNumbers...'
GO
CREATE TABLE [GoldenArcherLuckyNumbers] (
	[AccountID] VARCHAR(10) NOT NULL,
	[LuckyNumber] CHAR(12) NULL
)

CREATE INDEX IX_GoldenArcherLuckyNumbers_AccountID ON [GoldenArcherLuckyNumbers] ([AccountID])
GO

-- ----------------------------------------------------------------------------
-- Table Guild
-- ----------------------------------------------------------------------------
PRINT 'Creating table Guild...'
GO
CREATE TABLE [Guild] (
	[Number] INT NOT NULL IDENTITY(1,1),
	[G_Name] VARCHAR(8) NOT NULL,
	[G_Mark] VARBINARY(32) NULL,
	[G_Score] INT NOT NULL DEFAULT 0,
	[G_Master] VARCHAR(10) NULL,
	[G_Notice] VARCHAR(60) NULL,
	CONSTRAINT PK_Guild PRIMARY KEY ([Number])
)
GO

-- ----------------------------------------------------------------------------
-- Table GuildMember
-- ----------------------------------------------------------------------------
PRINT 'Creating table GuildMember...'
GO
CREATE TABLE [GuildMember] (
	[Name] VARCHAR(10) NOT NULL,
	[G_Name] VARCHAR(8) NOT NULL,
	[G_Status] TINYINT NOT NULL DEFAULT 0,
	CONSTRAINT PK_GuildMember PRIMARY KEY ([Name])
)
GO

-- ----------------------------------------------------------------------------
-- Table MEMB_INFO
-- ----------------------------------------------------------------------------
PRINT 'Creating table MEMB_INFO...'
GO
CREATE TABLE [MEMB_INFO] (
	[memb___id] VARCHAR(10) NOT NULL,
	[memb__pwd] VARCHAR(10) NOT NULL,
	[memb_name] VARCHAR(10) NOT NULL,
	[mail_addr] VARCHAR(50) NULL,
	[sno__numb] CHAR(18) NOT NULL,
	[AccountLevel] INT NOT NULL DEFAULT 0,
	[AccountExpireDate] SMALLDATETIME NOT NULL DEFAULT GETDATE(),
	[bloc_code] CHAR(1) NOT NULL,
	[Bloc_Expire] SMALLDATETIME NOT NULL DEFAULT GETDATE(),
	CONSTRAINT PK_MEMB_INFO PRIMARY KEY ([memb___id])
)
GO

-- ----------------------------------------------------------------------------
-- Table MEMB_STAT
-- ----------------------------------------------------------------------------
PRINT 'Creating table MEMB_STAT...'
GO
CREATE TABLE [MEMB_STAT] (
	[memb___id] VARCHAR(10) NOT NULL,
	[ConnectStat] TINYINT NULL,
	[ServerName] VARCHAR(50) NULL,
	[IP] VARCHAR(15) NULL,
	[ConnectTM] SMALLDATETIME NULL,
	[DisConnectTM] SMALLDATETIME NULL,
	[OnlineHours] INT NULL DEFAULT 0,
	CONSTRAINT PK_MEMB_STAT PRIMARY KEY ([memb___id])
)
GO

-- ----------------------------------------------------------------------------
-- Table OptionData
-- ----------------------------------------------------------------------------
PRINT 'Creating table OptionData...'
GO
CREATE TABLE [OptionData] (
	[Name] VARCHAR(10) NOT NULL,
	[SkillKey] BINARY(10) NULL,
	[GameOption] TINYINT NULL,
	[Qkey] TINYINT NULL,
	[Wkey] TINYINT NULL,
	[Ekey] TINYINT NULL,
	[ChatWindow] TINYINT NULL,
	CONSTRAINT PK_OptionData PRIMARY KEY ([Name])
)
GO

-- ----------------------------------------------------------------------------
-- Table RankingBloodCastle
-- ----------------------------------------------------------------------------
PRINT 'Creating table RankingBloodCastle...'
GO
CREATE TABLE [RankingBloodCastle] (
	[Name] VARCHAR(10) NOT NULL,
	[Score] INT NULL,
	CONSTRAINT PK_RankingBloodCastle PRIMARY KEY ([Name])
)
GO

-- ----------------------------------------------------------------------------
-- Table RankingDevilSquare
-- ----------------------------------------------------------------------------
PRINT 'Creating table RankingDevilSquare...'
GO
CREATE TABLE [RankingDevilSquare] (
	[Name] VARCHAR(10) NOT NULL,
	[Score] INT NULL,
	CONSTRAINT PK_RankingDevilSquare PRIMARY KEY ([Name])
)
GO

-- ----------------------------------------------------------------------------
-- Table ResetInfo
-- ----------------------------------------------------------------------------
PRINT 'Creating table ResetInfo...'
GO
CREATE TABLE [ResetInfo] (
	[Name] VARCHAR(10) NOT NULL,
	[ResetDay] INT NOT NULL DEFAULT 0,
	[ResetDayDate] SMALLDATETIME NULL,
	[ResetWek] INT NOT NULL DEFAULT 0,
	[ResetWekDate] SMALLDATETIME NULL,
	[ResetMon] INT NOT NULL DEFAULT 0,
	[ResetMonDate] SMALLDATETIME NULL,
	[GrandResetDay] INT NOT NULL DEFAULT 0,
	[GrandResetDayDate] SMALLDATETIME NULL,
	[GrandResetWek] INT NOT NULL DEFAULT 0,
	[GrandResetWekDate] SMALLDATETIME NULL,
	[GrandResetMon] INT NOT NULL DEFAULT 0,
	[GrandResetMonDate] SMALLDATETIME NULL,
	CONSTRAINT PK_ResetInfo PRIMARY KEY ([Name])
)
GO

-- ----------------------------------------------------------------------------
-- Table warehouse
-- ----------------------------------------------------------------------------
PRINT 'Creating table warehouse...'
GO
CREATE TABLE [warehouse] (
	[AccountID] VARCHAR(10) NOT NULL,
	[Items] VARBINARY(1200) NULL,
	[Money] INT NULL DEFAULT 0,
	[pw] SMALLINT NULL DEFAULT 0,
	CONSTRAINT PK_warehouse PRIMARY KEY ([AccountID])
)
GO

-- ----------------------------------------------------------------------------
-- Poblate table DefaultClassType with default values
-- ----------------------------------------------------------------------------

PRINT 'Inserting default class types...'
GO
INSERT [DefaultClassType] (Class, Level, LevelUpPoint, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, MapNumber, MapPosX, MapPosY, Quest, EffectList) VALUES (0, 1, 0, 18, 18, 15, 30,  0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 60, 60, 60, 60, 0, 125, 125, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
INSERT [DefaultClassType] (Class, Level, LevelUpPoint, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, MapNumber, MapPosX, MapPosY, Quest, EffectList) VALUES (16, 1, 0, 28, 20, 25, 10, 0x20001200000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 110, 110, 20, 20, 0, 125, 125, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
INSERT [DefaultClassType] (Class, Level, LevelUpPoint, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, MapNumber, MapPosX, MapPosY, Quest, EffectList) VALUES (32, 1, 0, 22, 25, 20, 15, 0x8F00FF0000000000000480001400000000000004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 80, 80, 30, 30, 3, 172, 97, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
INSERT [DefaultClassType] (Class, Level, LevelUpPoint, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, MapNumber, MapPosX, MapPosY, Quest, EffectList) VALUES (48, 1, 0, 26, 26, 26, 26, 0x01001600000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 110, 110, 60, 60, 0, 125, 125, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_CONNECT_MEMB
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_CONNECT_MEMB'
GO
CREATE PROCEDURE [WZ_CONNECT_MEMB]
	@inAccountID VARCHAR(10),
	@inServerName VARCHAR(50),
	@inIpAddress VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	IF EXISTS (SELECT 1 FROM MEMB_STAT WHERE memb___id = @inAccountID)
	BEGIN
		UPDATE MEMB_STAT
		SET ConnectStat = 1,
			ServerName = @inServerName,
			IP = @inIpAddress,
			ConnectTM = GETDATE()
		WHERE memb___id = @inAccountID
	END
	ELSE
	BEGIN
		INSERT INTO MEMB_STAT (memb___id, ConnectStat, ServerName, IP, ConnectTM)
		VALUES (@inAccountID, 1, @inServerName, @inIpAddress, GETDATE())
	END

	IF @@ERROR = 0
		COMMIT TRANSACTION
	ELSE
		ROLLBACK TRANSACTION

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_DISCONNECT_MEMB
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_DISCONNECT_MEMB'
GO
CREATE PROCEDURE [WZ_DISCONNECT_MEMB]
	@inAccountID VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	IF EXISTS (SELECT 1 FROM MEMB_STAT WHERE memb___id = @inAccountID)
	BEGIN
		UPDATE MEMB_STAT
		SET ConnectStat = 0, 
			DisConnectTM = GETDATE(), 
			OnlineHours = OnlineHours + DATEDIFF(HOUR, ConnectTM, GETDATE())
		WHERE memb___id = @inAccountID
	END

	IF @@ERROR = 0
		COMMIT TRANSACTION
	ELSE
		ROLLBACK TRANSACTION

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_DesblocAccount
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_DesblocAccount'
GO
CREATE PROCEDURE [WZ_DesblocAccount]
	@inAccountID VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	UPDATE MEMB_INFO
	SET bloc_code = 0
	WHERE memb___id = @inAccountID AND bloc_code = 1 AND bloc_expire < GETDATE()

	IF @@ERROR = 0
		COMMIT TRANSACTION
	ELSE
		ROLLBACK TRANSACTION

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_DesblocCharacters
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_DesblocCharacters'
GO
CREATE PROCEDURE [WZ_DesblocCharacters]
	@inAccountID VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	UPDATE Character
	SET CtlCode = 0
	WHERE AccountID = @inAccountID AND CtlCode = 1 AND bloc_expire < GETDATE()

	IF @@ERROR = 0
		COMMIT TRANSACTION
	ELSE
		ROLLBACK TRANSACTION

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_GetAccountLevel
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_GetAccountLevel'
GO
CREATE PROCEDURE [WZ_GetAccountLevel]
	@inAccountID VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @CurrentAccountLevel INT
	DECLARE @CurrentAccountExpireDate SMALLDATETIME

	SELECT @CurrentAccountLevel = AccountLevel, @CurrentAccountExpireDate = AccountExpireDate
	FROM MEMB_INFO
	WHERE memb___id = @inAccountID

	IF (@CurrentAccountLevel <> 0 AND GETDATE() >= @CurrentAccountExpireDate)
	BEGIN
		UPDATE MEMB_INFO
		SET AccountLevel = 0
		WHERE memb___id = @inAccountID

		SET @CurrentAccountLevel = 0
	END

	SELECT @CurrentAccountLevel AS AccountLevel, @CurrentAccountExpireDate AS AccountExpireDate

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_SetAccountLevel
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_SetAccountLevel'
GO
CREATE PROCEDURE [WZ_SetAccountLevel]
	@inAccountID VARCHAR(10),
	@inAccountLevel INT,
	@inAccountExpireTime INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	UPDATE MEMB_INFO
	SET AccountLevel = @inAccountLevel, 
		AccountExpireDate = CASE 
			WHEN AccountLevel = @inAccountLevel 
			THEN DATEADD(SECOND, @inAccountExpireTime, AccountExpireDate)
			ELSE DATEADD(SECOND, @inAccountExpireTime, GETDATE())
		END
	WHERE memb___id = @inAccountID

	IF @@ERROR = 0
		COMMIT TRANSACTION
	ELSE
		ROLLBACK TRANSACTION

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_CreateCharacter
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_CreateCharacter'
GO
CREATE PROCEDURE [WZ_CreateCharacter]
	@inAccountID VARCHAR(10),
	@inCharName VARCHAR(10),
	@inCharClass TINYINT
AS
BEGIN
	SET NOCOUNT ON

	-- Results cases:
	-- -- Return 1 if success
	-- -- Return 0 will show: 'Invalid character name or name supplied already exists.'
	-- -- Return 2 will show: 'No more characters can be created.'

	DECLARE @Result INT = 1

	IF EXISTS (SELECT 1 FROM Character WHERE Name = @inCharName)
	BEGIN
		SELECT 0 AS Result
		RETURN
	END

	BEGIN TRANSACTION

	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM AccountCharacter WHERE Id = @inAccountID)
		BEGIN
			INSERT INTO AccountCharacter (Id, GameID1, GameID2, GameID3, GameID4, GameID5, GameIDC)
			VALUES (@inAccountID, NULL, NULL, NULL, NULL, NULL, NULL)
		END
		ELSE
		BEGIN
			IF NOT EXISTS (
				SELECT 1 FROM AccountCharacter
				WHERE Id = @inAccountID
					AND (GameID1 IS NULL
						OR GameID2 IS NULL
						OR GameID3 IS NULL
						OR GameID4 IS NULL
						OR GameID5 IS NULL)
			)
			BEGIN
				ROLLBACK TRANSACTION
				SELECT 2 AS Result
				RETURN
			END
		END

		INSERT INTO Character (AccountID, Name, cLevel, LevelUpPoint, Class, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, BP, MaxBP, MapNumber, MapPosX, MapPosY, Quest, EffectList)
		SELECT @inAccountID, @inCharName, Level, LevelUpPoint, @inCharClass, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, 0, 0, MapNumber, MapPosX, MapPosY, Quest, EffectList
		FROM DefaultClassType 
		WHERE Class = @inCharClass

		COMMIT TRANSACTION
		SELECT 1 AS Result

	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT 2 AS Result
	END CATCH

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_DeleteCharacter
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_DeleteCharacter'
GO
CREATE PROCEDURE [WZ_DeleteCharacter] 
	@inAccountID VARCHAR(10),
	@inCharName VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	-- Results cases:
	-- -- Return 1 if success
	-- -- Return 0 will show: 'You cannot delete a character with guild.'
	-- -- Return 2 will show: 'You have entered an invalid personal ID number.'
	-- -- Return 3 will show: 'This is an item-blocked character.'

	DECLARE @Result TINYINT = 1

	BEGIN TRANSACTION

	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Character WHERE Name = @inCharName AND AccountID = @inAccountID)
		BEGIN
			DELETE FROM ResetInfo WHERE Name = @inCharName
			DELETE FROM OptionData WHERE Name = @inCharName
			DELETE FROM RankingBloodCastle WHERE Name = @inCharName
			DELETE FROM RankingDevilSquare WHERE Name = @inCharName
			DELETE FROM Character WHERE AccountID = @inAccountID AND Name = @inCharName

			UPDATE AccountCharacter
			SET GameID1 = NULLIF(GameID1, @inCharName),
				GameID2 = NULLIF(GameID2, @inCharName),
				GameID3 = NULLIF(GameID3, @inCharName),
				GameID4 = NULLIF(GameID4, @inCharName),
				GameID5 = NULLIF(GameID5, @inCharName),
				GameIDC = NULLIF(GameIDC, @inCharName)
			WHERE Id = @inAccountID
			AND (GameID1 = @inCharName
				OR GameID2 = @inCharName
				OR GameID3 = @inCharName
				OR GameID4 = @inCharName
				OR GameID5 = @inCharName
				OR GameIDC = @inCharName)

			SET @Result = 1
		END
		
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @Result = 2
	END CATCH

	SELECT @Result AS Result

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_GuildCreate
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_GuildCreate'
GO
CREATE PROCEDURE [WZ_GuildCreate]
	@inGuildName varchar(8),
	@inCharName varchar(10)
AS
BEGIN
	SET NOCOUNT ON

	-- Results cases:
	-- -- Return 1 if success
	-- -- Return 0 will show: 'The guild name already exists.'
	-- -- Return 2 will show: 'The guild name must be at least 2 characters long.'
	-- -- Return 3 will show: 'You are already in a guild.'
	-- -- Return 4 will show: 'No space allowed in guild names.'
	-- -- Return 5 will show: 'No symbols allowed in guild names.'
	-- -- Return 6 will show: 'Create guild failed.'

	DECLARE @Result INT = 1

	IF EXISTS (SELECT 1 FROM Guild WHERE G_Name = @inGuildName)
	BEGIN
		SET @Result = 0
		goto EndProcedure
	END

	IF EXISTS (SELECT 1 FROM GuildMember WHERE Name = @inCharName)
	BEGIN
		SET @Result = 3
		goto EndProcedure
	END

	BEGIN TRANSACTION

	INSERT INTO Guild (G_Name, G_Master)
	VALUES (@inGuildName, @inCharName)

	IF (@@Error <> 0)
	BEGIN
		SET @Result = 6
		ROLLBACK TRANSACTION
		goto EndProcedure
	END

	INSERT INTO GuildMember (Name, G_Name)
	VALUES (@inCharName, @inGuildName)

	IF (@@Error <> 0)
	BEGIN
		SET @Result = 6
		ROLLBACK TRANSACTION
		goto EndProcedure
	END

	COMMIT TRANSACTION

EndProcedure:

	SELECT @Result AS Result

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_SetGuildDelete
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_SetGuildDelete'
GO
CREATE PROCEDURE [WZ_SetGuildDelete]
	@inGuildName varchar(10)
AS
BEGIN
	SET NOCOUNT ON

	-- Results cases:
	-- -- Return 1 if success on member, will show 'You have just left the guild.'
	-- -- Return 4 if success on master, will show: 'The guild has been dissolved'
	-- -- Return 0 will show: 'Your personal ID number is incorrect.'
	-- -- Return 2 will show: 'Only the guild master can disband a guild.'
	-- -- Return 3 will show: 'There was an error deleting the guild'

	DECLARE @Result INT = 1

	BEGIN TRANSACTION

	DELETE FROM GuildMember
	WHERE G_Name = @inGuildName
	
	IF (@@Error <> 0)
	BEGIN
		SET @Result = 3
		ROLLBACK TRANSACTION
		goto EndProcedure
	END

	DELETE FROM Guild
	WHERE G_Name = @inGuildName

	IF (@@Error <> 0)
	BEGIN
		SET @Result = 3
		ROLLBACK TRANSACTION
		goto EndProcedure
	END

	COMMIT TRANSACTION

EndProcedure:

	SELECT @Result AS Result

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_GetGrandResetInfo
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_GetGrandResetInfo'
GO
CREATE PROCEDURE [WZ_GetGrandResetInfo]
	@inAccountID VARCHAR(10),
	@inCharName VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @GrandReset INT
	DECLARE @GrandResetDay INT
	DECLARE @GrandResetDayDate SMALLDATETIME
	DECLARE @GrandResetWek INT
	DECLARE @GrandResetWekDate SMALLDATETIME
	DECLARE @GrandResetMon INT
	DECLARE @GrandResetMonDate SMALLDATETIME

	IF NOT EXISTS (SELECT 1 FROM ResetInfo WHERE Name = @inCharName)
	BEGIN
		INSERT INTO ResetInfo (Name) VALUES (@inCharName)
	END

	SELECT @GrandReset = GrandResetCount
	FROM Character
	WHERE AccountID = @inAccountID AND Name = @inCharName

	SELECT @GrandResetDay = GrandResetDay, @GrandResetDayDate = GrandResetDayDate,
		@GrandResetWek = GrandResetWek, @GrandResetWekDate = GrandResetWekDate,
		@GrandResetMon = GrandResetMon, @GrandResetMonDate = GrandResetMonDate
	FROM ResetInfo
	WHERE Name = @inCharName

	IF DATEDIFF(DAY, @GrandResetDayDate, GETDATE()) > 0
	BEGIN
		SET @GrandResetDay = 0
		UPDATE ResetInfo SET GrandResetDay = 0 WHERE Name = @inCharName
	END

	IF DATEDIFF(DAY, @GrandResetWekDate, GETDATE()) > 0
	BEGIN
		SET @GrandResetWek = 0
		UPDATE ResetInfo SET GrandResetWek = 0 WHERE Name = @inCharName
	END

	IF DATEDIFF(DAY, @GrandResetMonDate, GETDATE()) > 0
	BEGIN
		SET @GrandResetMon = 0
		UPDATE ResetInfo SET GrandResetMon = 0 WHERE Name = @inCharName
	END

	SELECT @GrandReset AS GrandReset, @GrandResetDay AS GrandResetDay, @GrandResetWek AS GrandResetWek, @GrandResetMon AS GrandResetMon

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_SetGrandResetInfo
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_SetGrandResetInfo'
GO
CREATE PROCEDURE [WZ_SetGrandResetInfo]
	@inAccountID VARCHAR(10),
	@inCharName VARCHAR(10),
	@inReset INT,
	@inGrandReset INT,
	@inGrandResetDay INT,
	@inGrandResetWek INT,
	@inGrandResetMon INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRANSACTION

		UPDATE Character
		SET ResetCount = @inReset, GrandResetCount = @inGrandReset
		WHERE AccountID = @inAccountID AND Name = @inCharName

		UPDATE ResetInfo
		SET GrandResetDay = @inGrandResetDay, GrandResetDayDate = GETDATE(),
			GrandResetWek = @inGrandResetWek, GrandResetWekDate = GETDATE(),
			GrandResetMon = @inGrandResetMon, GrandResetMonDate = GETDATE()
		WHERE Name = @inCharName

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_GetResetInfo
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_GetResetInfo'
GO
CREATE PROCEDURE [WZ_GetResetInfo]
	@inAccountID VARCHAR(10),
	@inCharName VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @ResetCount INT
	DECLARE @ResetDay INT
	DECLARE @ResetDayDate SMALLDATETIME
	DECLARE @ResetWek INT
	DECLARE @ResetWekDate SMALLDATETIME
	DECLARE @ResetMon INT
	DECLARE @ResetMonDate SMALLDATETIME

	IF NOT EXISTS (SELECT 1 FROM ResetInfo WHERE Name = @inCharName)
	BEGIN
		INSERT INTO ResetInfo (Name) VALUES (@inCharName)
	END

	SELECT @ResetCount = ResetCount
	FROM Character
	WHERE AccountID = @inAccountID AND Name = @inCharName

	SELECT @ResetDay = ResetDay, @ResetDayDate = ResetDayDate,
		@ResetWek = ResetWek, @ResetWekDate = ResetWekDate,
		@ResetMon = ResetMon, @ResetMonDate = ResetMonDate
	FROM ResetInfo
	WHERE Name = @inCharName

	IF DATEDIFF(DAY, @ResetDayDate, GETDATE()) > 0
	BEGIN
		SET @ResetDay = 0
		UPDATE ResetInfo SET ResetDay = 0 WHERE Name = @inCharName
	END

	IF DATEDIFF(DAY, @ResetWekDate, GETDATE()) > 0
	BEGIN
		SET @ResetWek = 0
		UPDATE ResetInfo SET ResetWek = 0 WHERE Name = @inCharName
	END

	IF DATEDIFF(DAY, @ResetMonDate, GETDATE()) > 0
	BEGIN
		SET @ResetMon = 0
		UPDATE ResetInfo SET ResetMon = 0 WHERE Name = @inCharName
	END

	SELECT @ResetCount AS Reset, @ResetDay AS ResetDay, @ResetWek AS ResetWek, @ResetMon AS ResetMon

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_SetResetInfo
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_SetResetInfo'
GO
CREATE PROCEDURE [WZ_SetResetInfo]
	@inAccountID VARCHAR(10),
	@inCharName VARCHAR(10),
	@inReset INT,
	@inResetDay INT,
	@inResetWek INT,
	@inResetMon INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRANSACTION

		UPDATE Character
		SET ResetCount = @inReset
		WHERE AccountID = @inAccountID AND Name = @inCharName

		UPDATE ResetInfo
		SET ResetDay = @inResetDay, ResetDayDate = GETDATE(),
			ResetWek = @inResetWek, ResetWekDate = GETDATE(),
			ResetMon = @inResetMon, ResetMonDate = GETDATE()
		WHERE Name = @inCharName

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH

	SET NOCOUNT OFF
END
GO

-- ----------------------------------------------------------------------------
-- Routine WZ_GetItemSerial
-- ----------------------------------------------------------------------------
PRINT 'Creating procedure: WZ_GetItemSerial'
GO
CREATE PROCEDURE [WZ_GetItemSerial]
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @ItemSerial INT

	BEGIN TRY
		BEGIN TRANSACTION

		SELECT @ItemSerial = ItemCount
		FROM GameServerInfo
		WHERE Number = 0

		IF (@ItemSerial >= 2147483647) -- MAX INT VALUE
		BEGIN
			SET @ItemSerial = 1
		END
		ELSE
		BEGIN
			SET @ItemSerial = @ItemSerial + 1
		END

		UPDATE GameServerInfo
		SET ItemCount = @ItemSerial
		WHERE Number = 0

		IF (@@ERROR <> 0)
		BEGIN
			ROLLBACK TRANSACTION
			SELECT -1 AS Result
		END
		ELSE
		BEGIN
			COMMIT TRANSACTION
			SELECT @ItemSerial AS Result
		END
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT -1 AS Result
	END CATCH

	SET NOCOUNT OFF
END
GO
