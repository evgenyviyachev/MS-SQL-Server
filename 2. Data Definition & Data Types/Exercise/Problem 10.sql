ALTER TABLE Users
ADD CONSTRAINT [PassMinLength] CHECK (DATALENGTH([Password])>=5)