import streamlit as st
from gtts import gTTS
from io import BytesIO

st.title("🔊 Texto a voz en español")

texto = st.text_area(
    "Escribe el texto:",
    placeholder="Escribe aquí lo que quieras escuchar..."
)

if st.button("▶️ Escuchar") and texto.strip():
    audio = BytesIO()

    tts = gTTS(
        text=texto,
        lang="es"
    )
    tts.write_to_fp(audio)

    audio.seek(0)

    st.audio(
        audio.getvalue(),
        format="audio/mpeg"
    )
