pub enum Token {
    Identifier(String),
    Literal(Literal),
    Type(Type),
    Operator(Operator),
    Keyword(Keyword),
    Punctuation(Punctuation),
}

pub enum Literal {
    Integer(i32),
}

pub enum Type {
    Int,
}

pub enum Operator {
    Plus,
    Minus,
    Multiply,
    Divide,
    Modulo,
    Equal,
    NotEqual,
    LessThan,
    LessThanOrEqual,
    GreaterThan,
    GreaterThanOrEqual,
    And,
    Or,
    Not,
    Assign,
}

pub enum Keyword {
    If,
    While,
    Enter,
    Create,
    Destroy,
    Class,
    State,
}

pub enum Punctuation {
    OpenParen,
    CloseParen,
    OpenBrace,
    CloseBrace,
    Comma,
    Semicolon,
    Colon,
    DoubleColon,
}
