//
// Created by ALuier Bondar on 2019/12/26.
//

bool isValid(string s) {
    auto t = stack<char>();

    for (char c: s) {
        switch (c) {
            case '(':
            case '[':
            case '{':
                t.push(c);
                break;
            case ')':
                if (!popSymbol(t, '('))
                    return false;
                break;
            case ']':
                if (!popSymbol(t, '['))
                    return false;
                break;
            case '}':
                if (!popSymbol(t, '{'))
                    return false;
                break;
            default:
                return false;
        }
    }
    return t.empty();
}

bool popSymbol(stack<char>& t, char s) {
    if (!t.empty() && t.top() == s) {
        t.pop();
        return true;
    } else {
        return false;
    }
}
