import os
from typing import Optional, AsyncIterator
from anthropic import Anthropic
import dotenv

dotenv.load_dotenv()


class ClaudeClient:
    _instance: Optional['ClaudeClient'] = None
    _client: Optional[Anthropic] = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(ClaudeClient, cls).__new__(cls)
        return cls._instance
    
    def __init__(self):
        if self._client is None:
            self._model = os.getenv('CLAUDE_MODEL', 'claude-sonnet-4-20250514')

    def _ensure_client(self) -> Anthropic:
        if self._client is None:
            api_key = os.getenv('CLAUDE_API_KEY')
            if not api_key:
                raise ValueError("CLAUDE_API_KEY environment variable is not set")
            self._client = Anthropic(api_key=api_key)
        return self._client
    
    def get_client(self) -> Anthropic:
        return self._ensure_client()
    
    def get_model(self) -> str:
        return self._model
    
    async def stream_message(self, system_prompt: str, user_message: str, max_tokens: int = 2000) -> AsyncIterator[str]:
        client = self.get_client()
        
        with client.messages.stream(
            model=self._model,
            max_tokens=max_tokens,
            system=system_prompt,
            messages=[
                {
                    "role": "user",
                    "content": user_message
                }
            ]
        ) as stream:
            for text in stream.text_stream:
                yield text
    
    def create_message(self, system_prompt: str, user_message: str, max_tokens: int = 2000) -> str:
        client = self.get_client()
        
        message = client.messages.create(
            model=self._model,
            max_tokens=max_tokens,
            system=system_prompt,
            messages=[
                {
                    "role": "user",
                    "content": user_message
                }
            ]
        )
        
        return message.content[0].text


def get_claude_client() -> ClaudeClient:
    return ClaudeClient()
