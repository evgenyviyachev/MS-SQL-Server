SELECT CountryName, IsoCode FROM Countries
WHERE (LEN(CountryName) - LEN(REPLACE(CountryName,'a',''))) > 2
ORDER BY IsoCode