
def "nu-complete dotnet projects" [] {
  ^find . -type f -name "*.sln" -o -name "*.csproj" | lines
}

#
# SDK Commands
#

export extern "dotnet" [
  --diagnostics(-d) # Enable diagnostic output
  --help(-h) # Show command line help
  --info # Display .NET information
  --list-runtimes # Display the installed runtimes
  --list-sdks # Display the installed SDKs
  --version # Display .NET SDK version in use
]

# Add a package or reference to a .NET project
export extern "dotnet add" []

# Build a .NET project
export extern "dotnet build" [
  project: string@"nu-complete dotnet projects"
]

# Interact with servers started by a build
export extern "dotnet build-server" []

# Clean build outputs of a .NET project
export extern "dotnet clean" []

# Apply style preferences to a project or solution
export extern "dotnet format" []

# Show command line help
export extern "dotnet help" []

# List project references of a .NET project
export extern "dotnet list" []

# Run Microsoft Build Engine (MSBuild) commands
export extern "dotnet msbuild" []

# Create a new .NET project or file
export extern "dotnet new" []

# Provide additional NuGet commands
export extern "dotnet nuget" []

# Create a NuGet package
export extern "dotnet pack" []

# Publish a .NET project for deployment
export extern "dotnet publish" []

# Remove a package or reference from a .NET project
export extern "dotnet remove" []

# Restore dependencies specified in a .NET project
export extern "dotnet restore" []

# Build and run a .NET project output
export extern "dotnet run" []

# Manage .NET SDK installation
export extern "dotnet sdk" []

# Modify Visual Studio solution files
export extern "dotnet sln" []

# Store the specified assemblies in the runtime package store
export extern "dotnet store" []

# Run unit tests using the test runner specificed in a .NET project
export extern "dotnet test" [
  project: string@"nu-complete dotnet projects"
]

# Install or manage tools that extend the .NET experience
export extern "dotnet tool" []

# Run Microsoft Test Engine (VSTest) commands
export extern "dotnet vstest" []

# Manage optional workloads
export extern "dotnet workload" []

#
# Additional Commands
#

# Create and manage development certificates
export extern "dotnet dev-certs" []

# Start F# Interactive / execute F# scripts
export extern "dotnet fsi" []

# Manage JSON Web Toksn in development
export extern "dotnet user-jwts" []

# Manage development user secrets
export extern "dotnet user-secrets" []

# Start a file watcher that runs a command when files change
export extern "dotnet watch" []
