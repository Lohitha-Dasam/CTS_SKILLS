using NUnit.Framework;
using Moq;
using MagicFilesLib;
using System.Collections.Generic;

namespace MagicFilesLib.Tests
{
    [TestFixture]
    public class DirectoryExplorerTests
    {
        private Mock<IDirectoryExplorer> directoryMock;

        private readonly string _file1 = "file.txt";
        private readonly string _file2 = "file2.txt";

        [OneTimeSetUp]
        public void Init()
        {
            directoryMock = new Mock<IDirectoryExplorer>();

            directoryMock
                .Setup(x => x.GetFiles(It.IsAny<string>()))
                .Returns(new List<string>
                {
                    _file1,
                    _file2
                });
        }

        [Test]
        public void GetFiles_ReturnsExpectedFiles()
        {
            ICollection<string> files =
                directoryMock.Object.GetFiles(@"C:\Temp");

            Assert.That(files, Is.Not.Null);

            Assert.That(files.Count, Is.EqualTo(2));

            Assert.That(files, Does.Contain(_file1));
        }

        [Test]
        public void GetFiles_CalledOnce()
        {
            directoryMock.Object.GetFiles(@"C:\Temp");

            directoryMock.Verify(
                x => x.GetFiles(It.IsAny<string>()),
                Times.Once);
        }
    }
}