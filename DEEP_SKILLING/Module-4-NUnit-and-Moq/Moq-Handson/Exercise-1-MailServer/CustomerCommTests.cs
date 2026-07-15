using NUnit.Framework;
using Moq;
using CustomerCommLib;

namespace CustomerCommLib.Tests
{
    [TestFixture]
    public class CustomerCommTests
    {
        private Mock<IMailSender> mailSenderMock;
        private CustomerComm customerComm;

        [OneTimeSetUp]
        public void Init()
        {
            mailSenderMock = new Mock<IMailSender>();

            mailSenderMock
                .Setup(x => x.SendMail(It.IsAny<string>(), It.IsAny<string>()))
                .Returns(true);

            customerComm = new CustomerComm(mailSenderMock.Object);
        }

        [TestCase]
        public void SendMailToCustomer_ReturnsTrue()
        {
            bool result = customerComm.SendMailToCustomer();

            Assert.That(result, Is.True);
        }

        [Test]
        public void SendMail_CalledExactlyOnce()
        {
            customerComm.SendMailToCustomer();

            mailSenderMock.Verify(
                x => x.SendMail(It.IsAny<string>(), It.IsAny<string>()),
                Times.Once);
        }
    }
}