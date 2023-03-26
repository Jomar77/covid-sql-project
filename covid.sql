Select *
FROM CovidProject.dbo.Coviddeath
Order by 3,4

--Select *
--FROM CovidProject..CovidVaccine
--Order by 3,4

Select Location, date, max(total_cases), total_deaths, population
From CovidProject..Coviddeath
group by location, date
Order by 1,2

Select Location, date,population, total_cases,( CAST(total_deaths as float) / cast (total_cases  as float)) *100 as deathPercent
From CovidProject..Coviddeath
where location like '%new zealand%'
Order by 1,2

AlTER TABLE dbo.Coviddeath
ALTER COLUMN total_cases float;

Select Location, Population, max(total_cases),max( total_cases / population )*100 as infectedrate
From CovidProject..Coviddeath
--where location like '%new zealand%'
group by Location, Population
Order by infectedrate desc