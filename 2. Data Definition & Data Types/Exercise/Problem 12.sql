ALTER TABLE [dbo].[Users] 
DROP CONSTRAINT [PK__Users__77222459C8CB26E3]

ALTER TABLE [dbo].[Users]
ADD CONSTRAINT PrKey PRIMARY KEY ([Id])

ALTER TABLE [dbo].[Users]
ADD CONSTRAINT UniqueId UNIQUE ([Id])

ALTER TABLE [dbo].[Users]
ADD CONSTRAINT MinLengthId CHECK (DATALENGTH([Id])>=3)