using NUnit.Framework;
using Moq;
using PlayersManagerLib;
using System;

namespace PlayersManagerLib.Tests
{
    [TestFixture]
    public class PlayerTests
    {
        private Mock<IPlayerMapper> playerMapperMock;

        [OneTimeSetUp]
        public void Init()
        {
            playerMapperMock = new Mock<IPlayerMapper>();

            playerMapperMock
                .Setup(x => x.IsPlayerNameExistsInDb(It.IsAny<string>()))
                .Returns(false);

            playerMapperMock
                .Setup(x => x.AddNewPlayerIntoDb(It.IsAny<string>()));
        }

        [Test]
        public void RegisterNewPlayer_ValidPlayer_ReturnsPlayer()
        {
            Player player =
                Player.RegisterNewPlayer(
                    "Virat",
                    playerMapperMock.Object);

            Assert.That(player, Is.Not.Null);

            Assert.That(player.Name, Is.EqualTo("Virat"));

            Assert.That(player.Age, Is.EqualTo(23));

            Assert.That(player.Country, Is.EqualTo("India"));

            Assert.That(player.NoOfMatches, Is.EqualTo(30));
        }

        [Test]
        public void RegisterNewPlayer_PlayerAlreadyExists_ThrowsArgumentException()
        {
            playerMapperMock
                .Setup(x => x.IsPlayerNameExistsInDb(It.IsAny<string>()))
                .Returns(true);

            Assert.Throws<ArgumentException>(
                () => Player.RegisterNewPlayer(
                    "Virat",
                    playerMapperMock.Object));
        }

        [Test]
        public void RegisterNewPlayer_EmptyName_ThrowsArgumentException()
        {
            Assert.Throws<ArgumentException>(
                () => Player.RegisterNewPlayer(
                    "",
                    playerMapperMock.Object));
        }

        [Test]
        public void RegisterNewPlayer_AddPlayerCalledOnce()
        {
            Player.RegisterNewPlayer(
                "Virat",
                playerMapperMock.Object);

            playerMapperMock.Verify(
                x => x.AddNewPlayerIntoDb(It.IsAny<string>()),
                Times.Once);
        }
    }
}