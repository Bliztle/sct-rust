use crate::compiler::tokens::Token;
pub fn create_tokens() -> Vec<Token> {
    vec![Token::Identifier(String::from("setup"))]
}
