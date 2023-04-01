Select *
FROM CovidProject.dbo.Coviddeath
Order by 3,4

--Select *
--FROM CovidProject..CovidVaccine
--Order by 3,4

Select *
From CovidProject..Coviddeath


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

Select Location, max(cast(total_deaths as int)) as totaldeathcount
From CovidProject..Coviddeath
where continent is not null and location like 'new zealand'
group by Location
Order by totaldeathcount desc

Select location, max(cast(total_deaths as int)) as totaldeathcount
From CovidProject..Coviddeath
where continent is null
group by location
Order by totaldeathcount desc

Select SUM(new_cases) as total_cases, Sum(Cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int)) / sum(new_cases) *100 as deathpercentage
From CovidProject..Coviddeath
where continent is not null
--group by date
Order by 1,2


Select *
From CovidProject..Coviddeath dea
join CovidProject..CovidVaccine vac
	on dea.location = vac.location
	and dea.date = dea.date

