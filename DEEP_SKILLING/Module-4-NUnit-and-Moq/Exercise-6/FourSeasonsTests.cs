using NUnit.Framework;
using FourSeasonsLib;
using System.Collections;

namespace FourSeasonsLib.Tests
{
    [TestFixture]
    public class FourSeasonsTests
    {
        private FourSeasons seasons;

        [SetUp]
        public void SetUp()
        {
            seasons = new FourSeasons();
        }

        // TestCaseSource
        public static IEnumerable SeasonTestData()
        {
            yield return new TestCaseData("February", "Spring");
            yield return new TestCaseData("March", "Spring");

            yield return new TestCaseData("April", "Summer");
            yield return new TestCaseData("May", "Summer");
            yield return new TestCaseData("June", "Summer");

            yield return new TestCaseData("July", "Monsoon");
            yield return new TestCaseData("August", "Monsoon");
            yield return new TestCaseData("September", "Monsoon");

            yield return new TestCaseData("October", "Autumn");
            yield return new TestCaseData("November", "Autumn");

            yield return new TestCaseData("December", "Winter");
            yield return new TestCaseData("January", "Winter");
        }

        [Test]
        [TestCaseSource(nameof(SeasonTestData))]
        public void GetSeason_ValidMonth_ReturnsExpectedSeason(string month, string expected)
        {
            string actual = seasons.GetSeason(month);

            Assert.That(actual, Is.EqualTo(expected));
        }
    }
}