SELECT COUNT(sub.CountryCode) AS CountryCode FROM
(SELECT c.CountryCode
   FROM Countries AS c
   FULL JOIN MountainsCountries AS mc
     ON c.CountryCode = mc.CountryCode
  WHERE mc.MountainId IS NULL) AS sub