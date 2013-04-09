SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niall Duane
-- Create date: 03/08/2010
-- Description:	returns the number of days between 2 dates
-- excluding Weekend Days.
-- =============================================
CREATE FUNCTION dbo.DaysExcludingWeekends
(
	@start DATETIME,
	@end DATETIME
)
RETURNS INT
AS
BEGIN
	SET @start = 
		CASE DATENAME(dw , @start)
		WHEN 'Saturday' THEN DATEADD(dd,1, @start)
		ELSE @start END;

	SET @end = 
		CASE DATENAME(dw , @end)
		WHEN 'Saturday' THEN DATEADD(dd,1, @end)
		ELSE @end END;

	-- Return the result of the function
	RETURN CONVERT(INT,DATEDIFF(dd, @start, @end) - 
	(DATEDIFF(ww, @start, @end)*2*24)/24.0)

END
GO
