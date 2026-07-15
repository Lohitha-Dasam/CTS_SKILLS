using NUnit.Framework;
using System;
using UserManagerLib;

namespace UserManagerLib.Tests
{
    [TestFixture]
    public class UserManagerTests
    {
        private UserManager manager;

        [SetUp]
        public void SetUp()
        {
            manager = new UserManager();
        }

        // Happy Path
        [Test]
        public void CreateUser_ValidPAN_ReturnsTrue()
        {
            bool result = manager.CreateUser("ABCDE1234F");

            Assert.That(result, Is.True);
        }

        // Null PAN
        [Test]
        public void CreateUser_NullPAN_ThrowsNullReferenceException()
        {
            NullReferenceException ex = Assert.Throws<NullReferenceException>(
                () => manager.CreateUser(null));

            Assert.That(ex, Is.Not.Null);
        }

        // Empty PAN
        [Test]
        public void CreateUser_EmptyPAN_ThrowsNullReferenceException()
        {
            NullReferenceException ex = Assert.Throws<NullReferenceException>(
                () => manager.CreateUser(""));

            Assert.That(ex, Is.Not.Null);
        }

        // Invalid Length
        [Test]
        public void CreateUser_InvalidLengthPAN_ThrowsFormatException()
        {
            FormatException ex = Assert.Throws<FormatException>(
                () => manager.CreateUser("ABC123"));

            Assert.That(ex, Is.Not.Null);
        }
    }
}