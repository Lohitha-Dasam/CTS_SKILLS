using NUnit.Framework;
using System;
using UtilLib;

namespace UtilLib.Tests
{
    [TestFixture]
    public class UrlHostNameParserTests
    {
        private UrlHostNameParser parser;

        [SetUp]
        public void SetUp()
        {
            parser = new UrlHostNameParser();
        }

        [Test]
        public void ParseHostName_HttpUrl_ReturnsHostName()
        {
            string result = parser.ParseHostName("http://www.google.com/index.html");

            Assert.That(result, Is.EqualTo("www.google.com"));
        }

        [Test]
        public void ParseHostName_HttpsUrl_ReturnsHostName()
        {
            string result = parser.ParseHostName("https://github.com/openai");

            Assert.That(result, Is.EqualTo("github.com"));
        }

        [Test]
        public void ParseHostName_InvalidProtocol_ThrowsFormatException()
        {
            FormatException ex = Assert.Throws<FormatException>(
                () => parser.ParseHostName("ftp://example.com"));

            Assert.That(ex.Message, Is.EqualTo("Url is not in correct format"));
        }
    }
}