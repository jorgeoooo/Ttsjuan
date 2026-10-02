import streamlit as st
from gtts import gTTS
from io import BytesIO

st.title("🔊 Texto a voz")

texto = st.text_area(
    "Escribe el texto:",
    placeholder="Escribe aquí lo que quieras escuchar..."
)

if st.button("▶️ Escuchar") and texto.strip():
    audio = BytesIO()

    tts = gTTS(text=texto, lang="es")
    tts.write_to_fp(audio)

    st.audio(
        audio.getvalue(),
        format="audio/mpeg",
        autoplay=True
    )
