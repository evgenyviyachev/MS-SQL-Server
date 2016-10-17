SELECT i.[Name], i.Price, i.MinLevel, gt.[Name] AS 'Forbidden Game Type' FROM Items AS i
  LEFT OUTER JOIN GameTypeForbiddenItems AS gtfi
    ON gtfi.ItemId = i.Id
  LEFT OUTER JOIN GameTypes AS gt
    ON gtfi.GameTypeId = gt.Id
 ORDER BY 4 DESC, 1