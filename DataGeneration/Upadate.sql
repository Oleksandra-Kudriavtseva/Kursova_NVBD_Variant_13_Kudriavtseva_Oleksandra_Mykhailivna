UPDATE LeaseContract
SET EndDate = DATEADD(YEAR, 1, StartDate)
WHERE EndDate IS NOT NULL
  AND StartDate >= EndDate;
