/*
Queries used for Tableau Project
*/


-- 1. 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as Death_Percentage
From PortfolioProject..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

-- Just a double check based off the data provided
-- numbers are extremely close so we will keep them - The Second includes "International"  Location


--Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
--From PortfolioProject..CovidDeaths
----Where location like '%states%'
--where location = 'World'
----Group By date
--order by 1,2


-- 2. 

-- We take these out as they are not included in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as int)) as Total_Death_Count
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent is null AND location NOT LIKE '%income%'
and location not in ('World', 'European Union', 'International')
Group by location
order by Total_Death_Count desc


-- 3.

Select Location, Population, MAX(total_cases) as Highest_Infection_Count,  Max((total_cases/population))*100 as Percent_Population_Infected
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Group by Location, Population
order by Percent_Population_Infected desc


-- 4.


Select Location, Population,date, MAX(total_cases) as Highest_Infection_Count,  Max((total_cases/population))*100 as Percent_Population_Infected
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Group by Location, Population, date
order by Percent_Population_Infected desc

