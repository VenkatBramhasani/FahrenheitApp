using Microsoft.VisualStudio.TestTools.UnitTesting;
using FahrenheitApp.Models;

namespace UnittestTemperature
{
    [TestClass]
    public class UnittestTemperature
    {
        [TestMethod]
       public void TestFahrenheitConversion()
        {
            double temperatureCelsius = 22;
            double temperatureFahrenheitActual;
            double temperatureFahrenheitExpected = 71.6;

            temperatureFahrenheitActual = Temperature.CelsiusToFahrenheit(temperatureCelsius);

            Assert.AreEqual(temperatureFahrenheitExpected, temperatureFahrenheitActual, 0.001, "Temperature Conversion not correct");
        }
    }
}
