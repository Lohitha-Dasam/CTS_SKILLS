using NUnit.Framework;
using CollectionsLib;
using System.Linq;

namespace CollectionsLib.Tests
{
    [TestFixture]
    public class CollectionsTests
    {
        private EmployeeManager manager;

        [SetUp]
        public void SetUp()
        {
            manager = new EmployeeManager();
        }

        // Scenario 1
        [Test]
        public void GetEmployees_NoNullValues_ReturnsTrue()
        {
            var employees = manager.GetEmployees();

            Assert.That(employees, Has.None.Null);
        }

        // Scenario 2
        [Test]
        public void GetEmployees_Employee100Exists_ReturnsTrue()
        {
            var employees = manager.GetEmployees();

            Assert.That(employees.Any(e => e.EmpId == 100), Is.True);
        }

        // Scenario 3
        [Test]
        public void GetEmployees_AllEmployeesUnique_ReturnsTrue()
        {
            var employees = manager.GetEmployees();

            int totalEmployees = employees.Count;
            int uniqueEmployees = employees.Select(e => e.EmpId).Distinct().Count();

            Assert.That(uniqueEmployees, Is.EqualTo(totalEmployees));
        }

        // Scenario 4
        [Test]
        public void CompareCollections_AllEmployeesPresent_ReturnsTrue()
        {
            var list1 = manager.GetEmployees();
            var list2 = manager.GetEmployeesWhoJoinedInPreviousYears();

            CollectionAssert.AreEquivalent(list1.Select(e => e.EmpId),
                                           list2.Select(e => e.EmpId));
        }
    }
}