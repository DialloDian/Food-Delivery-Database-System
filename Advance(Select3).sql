-- Find couriers names and rating
--SELECT * FROM CouriertRating
--SELECT * FROM Courier
IF EXISTS (SELECT * FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'GetCourierRatings') 
			AND type in (N'P', N'PC'))
DROP PROCEDURE GetCourierRatings
GO

CREATE PROC GetCourierRatings
@Score INT = NULL
,@Comments VARCHAR (30) = NULL

AS
BEGIN
	IF(@Score IS NOT NULL)
	BEGIN
		SELECT DISTINCT ce.FirstName 
		,ce.LastName
		,cr.Score
		,cr.Comments
	
		FROM CouriertRating cr INNER JOIN Courier ce ON ce.CourierID = cr.CourierID
		WHERE Score = @Score
		GROUP BY ce.FirstName, ce.LastName, cr.Score, cr.Comments
	END
	ELSE
	BEGIN
	IF(@Comments IS NOT NULL)
	BEGIN
		SELECT DISTINCT ce.FirstName 
		,ce.LastName
		,cr.Score
		,cr.Comments
	
		FROM CouriertRating cr INNER JOIN Courier ce ON ce.CourierID = cr.CourierID
		WHERE cr.Comments = @Comments
		GROUP BY ce.FirstName, ce.LastName, cr.Score, cr.Comments
	END
	ELSE	
	BEGIN
		SELECT DISTINCT ce.FirstName 
		,ce.LastName
		,cr.Score
		,cr.Comments
	
		FROM CouriertRating cr INNER JOIN Courier ce ON ce.CourierID = cr.CourierID
		GROUP BY ce.FirstName, ce.LastName, cr.Score, cr.Comments
	END
	END
END
