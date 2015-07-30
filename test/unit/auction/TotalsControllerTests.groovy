
package auction
import org.apache.commons.lang.StringUtils;



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(TotalsController)
class TotalsControllerTests {

    void testSomething() {
       assert(",,a,b,,,c".split(",").size() == 7);
    }
}
