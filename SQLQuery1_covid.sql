
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