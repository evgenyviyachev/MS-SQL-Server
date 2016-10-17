SELECT cust.CustomerID, cust.FirstName, cust.LastName, cust.Gender, c.CityName
  FROM Customers AS cust
 INNER JOIN Cities AS c
    ON cust.CityID = c.CityID
 WHERE (cust.LastName LIKE 'Bu%'
    OR cust.FirstName LIKE '%a')
   AND LEN(c.CityName) >= 8