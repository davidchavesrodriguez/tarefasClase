import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

public class FormTest {

    WebDriver driver;

    @Before
    public void setUP() {
        System.setProperty("webdriver.chrome.driver",
                "/home/sanclemente.local/a22davidcr/Escritorio/RepoProbas/driver/chromedriver");
        driver = new ChromeDriver();
        driver.get("https://www.chess.com/");
    }

    @Test
    public void testComputer() {

        WebElement a = driver.findElement(By.xpath("//input[@title='Sign up']"));
        a.click();

    }

    /*
     * @Test
     * public void testRadio() {
     * 
     * WebElement masaFina =
     * driver.findElement(By.cssSelector("[name='boton' value='1']"));
     * masaFina.click();
     * WebElement masaGruesa =
     * driver.findElement(By.xpath("//input[@name='boton' and @value='2']"));
     * masaGruesa.click();
     * }
     * 
     * @Test
     * public void testComo() {
     * 
     * Select menu = new Select(driver.findElement(By.name("menu")));
     * menu.selectByIndex(0);
     * menu.selectByValue("2");
     * menu.selectByVisibleText("Tres");
     * }
     */

}