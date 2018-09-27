#include "gui.h"

void iniciaGUI() {
    initscr();
    noecho();
    cbreak();
    curs_set(false);
}

WINDOW* criaJanelaDialogo() {
    int yMax, xMax;
    getmaxyx(stdscr, yMax, xMax);
    // newwin(nlines, ncolumns, yo, xo)
    WINDOW* window = newwin(20, xMax - 12, 1, 5);
    return window;
}

WINDOW* criaJanelaMenu() {
    int yMax, xMax;
    getmaxyx(stdscr, yMax, xMax);
    // newwin(nlines, ncolumns, yo, xo)
    WINDOW *window= newwin(6, xMax-12, yMax-8, 5);
    return window;
}

void mostraDialogo(WINDOW* window, string title, string linhas[], int numLinhas) {
    box(window, 0, 0);

    // (window, yo, xo, msg)
    string msg = " " + title + " ";
    mvwprintw(window, 0, 2, msg.c_str());

    for(int i = 0; i < numLinhas; i++) {
        mvwprintw(window, i + 1, 2, linhas[i].c_str());
    }

    refresh();
    wrefresh(window);
    keypad(window, true);
}

void proximoDialogo(WINDOW* window, string title, string linhas[], int numLinhas) {
    keypad(window, true);
    mvwprintw(window, 19, 2, " Pressione [Seta para Direita] para continuar ");
    refresh();
    wrefresh(window);
    
    int botaoPressionado;
    bool proceed = true;
    while(proceed) {
        botaoPressionado = wgetch(window);
        switch(botaoPressionado) {
            case KEY_LEFT:
                // if (highlight - 1 >= 0) highlight--;
                break;
            case KEY_RIGHT:
                wclear(window);
                refresh();
                wrefresh(window);
                mostraDialogo(window, title, linhas, numLinhas);
                proceed = false;
                break;
            default: break;
        }
    }
} 

int realizaPergunta(WINDOW* window, string title, string *opcoes, int numOpcoes) {
    int botaoPressionado, highlight = 0;
    
    box(window, 0, 0);
    keypad(window, true);
    string msg = " " + title + " ";
    mvwprintw(window, 0, 2, msg.c_str());
    
    refresh();
    wrefresh(window);

    while(1) {
        for(int i = 0; i < numOpcoes; i++) {
            if (i == highlight)
                wattron(window, A_REVERSE);
            mvwprintw(window, i + 1, 2, opcoes[i].c_str());
            wattroff(window, A_REVERSE);
        }

        botaoPressionado = wgetch(window);
        switch(botaoPressionado) {
            case KEY_UP:
                highlight--;
                if (highlight == -1) highlight = 0;
                break;
            case KEY_DOWN:
                highlight++;
                if (highlight == numOpcoes) highlight = numOpcoes - 1;
                break;
            default: break;
        }

        // 10 = TECLA ENTER
        if (botaoPressionado == 10) {
            break;
        }
    }

    wclear(window);
    wrefresh(window);
    return highlight;
}

bool confirmacao(WINDOW* window) {
    int botaoPressionado, highlight = 0;
    string confirmacoes[] = {"Sim", "Nao"};
    box(window, 0, 0);
    keypad(window, true);
    mvwprintw(window, 0, 2, " Tem certeza da sua decisao? ");
    wrefresh(window);

    while(1) {
        for(int i = 0; i < 2; i++) {
            if (i == highlight)
                wattron(window, A_REVERSE);
            mvwprintw(window, i + 2, 2, confirmacoes[i].c_str());
            wattroff(window, A_REVERSE);
        }

        botaoPressionado = wgetch(window);
        switch(botaoPressionado) {
            case KEY_UP:
                highlight--;
                if (highlight  == -1) highlight = 0;
                break;
            case KEY_DOWN:
                highlight++;
                if (highlight  == 2) highlight = 1;
                break;
            default: break;
        }

        // 10 = enter
        if (botaoPressionado == 10) {
            break;
        }
    }

    bool result = highlight != 1;
    wclear(window);
    refresh();
    wrefresh(window);
    return result;
}

string getstring() {
    string input;

    // let the terminal do the line editing
    nocbreak();
    echo();

    // this reads from buffer after <ENTER>, not "raw" 
    // so any backspacing etc. has already been taken care of
    int ch = getch();

    while ( ch != '\n' ) {
        input.push_back( ch );
        ch = getch();
    }

    // restore your cbreak / echo settings here
    noecho();
    cbreak();
    return input;
}