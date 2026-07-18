using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace FirstWebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [AllowAnonymous]
    public class AuthController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetToken()
        {
            string token = GenerateJSONWebToken(101, "Admin");

            return Ok(token);
        }

        private string GenerateJSONWebToken(int userId, string role)
        {
            var securityKey =
                new SymmetricSecurityKey(
                    Encoding.UTF8.GetBytes("mysuperdupersecret"));

            var credentials =
                new SigningCredentials(
                    securityKey,
                    SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, "User"),

                new Claim(JwtRegisteredClaimNames.Jti,
                    Guid.NewGuid().ToString()),

                new Claim(ClaimTypes.Role, role),

                new Claim("UserId", userId.ToString())
            };

            var token =
                new JwtSecurityToken(
                    issuer: "mySystem",
                    audience: "myUsers",
                    claims: claims,

                    // Token valid for 10 minutes
                    expires: DateTime.UtcNow.AddMinutes(10),

                    signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}