/*
Copyright <2018> <Ibraheem Moosa>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

public class MyApp : Gtk.Application {

    public MyApp () {
        Object (
            application_id : "com.githum.ibraheem-moosa.vala-random-number",
            flags : ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var button_hello = new Gtk.Button.with_label ("Click me!");
        button_hello.margin = 15;
        int random_number = (int)((new DateTime.now_utc()).to_unix() % 10000);
        button_hello.clicked.connect (() => {
            random_number = next_random_number(random_number);
            button_hello.label = "Your Random Number is " +
                        random_number.to_string() + "!";
            button_hello.sensitive = true;
        });
        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 500;
        main_window.default_width = 500;
        main_window.title = "4-Rand";
        main_window.add (button_hello);
        main_window.show_all ();
    }

    private static int next_random_number(int seed) {
        int squared = seed * seed;
        squared /= 100;
        return squared % 10000;
    }

    public static int main (string [] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}
