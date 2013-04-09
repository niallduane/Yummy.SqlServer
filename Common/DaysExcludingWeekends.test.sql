declare @start datetime,
	@end datetime;

set @start = convert(datetime,'01/01/2008',103);
set @end = convert(datetime,'01/01/2011',103);

select DaysExcludingWeekends(@start,@end);