SELECT TOP 5 cust.CustomerID, l.Amount
  FROM Customers AS cust
 INNER JOIN Loans AS l
    ON l.CustomerID = cust.CustomerID
 WHERE l.Amount > (SELECT AVG(l.Amount) FROM Loans AS l
				    INNER JOIN Customers AS cust
					   ON l.CustomerID = cust.CustomerID
					WHERE cust.Gender = 'M')
 ORDER BY cust.LastName