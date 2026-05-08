param(
    [ValidateSet("quick", "full", "serve", "docker", "production", "prettier", "doctor")]
    [string]$Mode = "quick"
)

$ErrorActionPreference = "Stop"

function Test-Command($Name) {
    return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Invoke-Step($Title, [scriptblock]$Block) {
    Write-Host ""
    Write-Host "==> $Title"
    $global:LASTEXITCODE = 0
    & $Block
    if ($global:LASTEXITCODE -ne 0) {
        throw "Step failed with exit code ${global:LASTEXITCODE}: $Title"
    }
}

function Invoke-NpmCiIfNeeded {
    if (-not (Test-Path "node_modules")) {
        Invoke-Step "Installing Node dependencies with npm ci" { npm ci }
    }
}

function Invoke-PrettierCheck {
    if (-not (Test-Command "npm")) {
        throw "npm is not available. Install Node.js or use Docker-only validation."
    }
    Invoke-NpmCiIfNeeded
    Invoke-Step "Checking formatting with Prettier" { npx prettier . --check }
}

function Invoke-DockerBuild {
    if (-not (Test-Command "docker")) {
        throw "docker is not available."
    }
    Invoke-Step "Building site with Docker Compose" {
        docker compose run --rm jekyll jekyll build
    }
}

function Invoke-ProductionBuild {
    if (-not (Test-Command "docker")) {
        throw "docker is not available."
    }
    Invoke-Step "Running production-like Docker build" {
        docker compose run --rm -e JEKYLL_ENV=production jekyll bash -lc "bundle exec jekyll build && purgecss -c purgecss.config.js"
    }
}

function Invoke-Doctor {
    Invoke-Step "Tool availability" {
        foreach ($cmd in @("docker", "npm", "ruby", "bundle", "jekyll")) {
            if (Test-Command $cmd) {
                Write-Host "${cmd}: available"
            } else {
                Write-Host "${cmd}: missing"
            }
        }
    }

    if (Test-Command "docker") {
        Invoke-Step "Docker versions" {
            docker --version
            docker compose version
        }
        Invoke-Step "Relevant cached Docker images" {
            docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.Size}}" | Select-String -Pattern "al-folio|ruby|jekyll|REPOSITORY"
        }
    }

    if (Test-Command "npm") {
        Invoke-Step "Node versions" {
            node --version
            npm --version
        }
    }
}

switch ($Mode) {
    "quick" {
        Invoke-DockerBuild
    }
    "full" {
        Invoke-PrettierCheck
        Invoke-ProductionBuild
    }
    "serve" {
        if (-not (Test-Command "docker")) {
            throw "docker is not available."
        }
        Invoke-Step "Starting local site at http://localhost:8080" {
            docker compose up
        }
    }
    "docker" {
        Invoke-DockerBuild
    }
    "production" {
        Invoke-ProductionBuild
    }
    "prettier" {
        Invoke-PrettierCheck
    }
    "doctor" {
        Invoke-Doctor
    }
}
