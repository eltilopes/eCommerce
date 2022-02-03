const TOKEN = "token";
class Constaints {
    static TOKEN = "TOKEN";
    static UUID_USER = "UUIDUSER";
    static FORNECEDOR = "fornecedor";
    
    // Simple function
    static printSum = (a, b) => {
      return a + b;
    };
    // Simple function
    static multiply = (a, b) => {
      return a * b;
    };
    // Return Promise
    static getPromiseData = () => {
      return Promise.resolve({ name: "JsMount", id: 123 });
    };
  }
  export default Constaints;