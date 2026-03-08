#!/bin/bash
dotnet test --logger "trx;LogFileName=Pi.Math.trx" Jenkins/Jenkins_Upgradev3/jenkins-plugin-model/src/Pi.Math.Tests/Pi.Math.Tests.csproj
dotnet test --logger "trx;LogFileName=Pi.Runtime.trx" Jenkins/Jenkins_Upgradev3/jenkins-plugin-model/src/Pi.Runtime.Tests/Pi.Runtime.Tests.csproj