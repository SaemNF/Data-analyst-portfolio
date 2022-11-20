
Select *
from PortfolioProject..CovidDeaths
order by 3,4

-- select data that we are going to be using

Select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
order by 1,2

-- looking at total cases vs total deaths
-- shows likelihood of dying if you contract covid in your country

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%malaysia%'
order by 1,2 

-- looking at Total Cases vs Total Population
-- shows what percentage of population got covid

Select location, date, population, total_cases, (total_cases/population)*100 as CasesPercentage
from PortfolioProject..CovidDeaths
where location like '%malaysia%'
order by 1,2

-- country with the highest infection rate compared to the population

Select location, population, MAX(total_cases) as highest_InfectionCount, (MAX(total_cases/population))*100 as InfectionPercent
from PortfolioProject..CovidDeaths
group by location, population
order by InfectionPercent desc

-- country with the highest deaths rate compared to the population

Select location, population, MAX(total_deaths) as highest_DeathCount, (MAX(total_deaths/population))*100 as DeathPercent
from PortfolioProject..CovidDeaths
group by location, population
order by highest_DeathCount desc

-- global infection rate

Select location, population, (MAX(total_cases)) as TotalInfectionCount
from PortfolioProject..CovidDeaths
group by location, population
order by TotalInfectionCount desc

--country with highest death cases

Select continent, location, population, MAX(total_cases) as Max_total_cases, MAX(total_deaths) as Max_total_deaths
from PortfolioProject..CovidDeaths
where continent is not null
group by continent, location, population
order by Max_total_deaths desc

--total global deaths vs total population

Select location, population, MAX(total_cases) as Max_total_cases, MAX(total_deaths) as Max_total_deaths, (MAX(total_deaths/population))*100 as DeathPercent
from PortfolioProject..CovidDeaths
where location like '%World%'
group by location, population
