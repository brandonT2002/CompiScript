package Components;

public class ErrorS {
    int line;
    int column;
    Object token;
    String type;
    public ErrorS(int line, int column, Object token, String type) {
        this.line = line;
        this.column = column;
        this.token = token;
        this.type = type;
    }
    public void print() {
        System.out.println(
            "Syntaxis Error" + (token != null ? " in line " + line + " column " + column : "") +
            ". This component was not expected: " + (token != null ? type + " = " + token : "EOF") + "."
        );
    }    
}
