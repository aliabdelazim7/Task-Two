@echo off
echo Testing Java Compilation...
echo.

REM Check if Java compiler is available
javac -version >nul 2>nul
if %errorlevel% neq 0 (
    echo Java compiler not found. Please ensure Java is installed and in PATH.
    pause
    exit /b 1
)

echo Java compiler found. Testing compilation...
echo.

REM Create a simple test class to verify compilation
echo public class CompilationTest { > CompilationTest.java
echo     public static void main(String[] args) { >> CompilationTest.java
echo         System.out.println("Java compilation test successful!"); >> CompilationTest.java
echo     } >> CompilationTest.java
echo } >> CompilationTest.java

echo Testing basic Java compilation...
javac CompilationTest.java
if %errorlevel% equ 0 (
    echo Basic Java compilation: SUCCESS
    echo.
    echo Testing Java execution...
    java CompilationTest
    echo.
    echo Java environment is working correctly!
) else (
    echo Basic Java compilation: FAILED
)

REM Clean up test files
del CompilationTest.java CompilationTest.class >nul 2>nul

echo.
echo Note: This project requires Maven for building with dependencies.
echo Please install Maven or use IntelliJ IDEA to build the full project.
pause
