using Microsoft.AspNetCore.Mvc;

namespace FirstWebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ValuesController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new string[]
            {
                "Apple",
                "Banana",
                "Orange"
            });
        }

        [HttpPost]
        public IActionResult Post()
        {
            return Ok("POST Request Executed Successfully");
        }

        [HttpPut]
        public IActionResult Put()
        {
            return Ok("PUT Request Executed Successfully");
        }

        [HttpDelete]
        public IActionResult Delete()
        {
            return Ok("DELETE Request Executed Successfully");
        }
    }
}