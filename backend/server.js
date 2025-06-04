const express = require('express');
const app = express();
const PORT = process.env.PORT || 5000;

app.get('/api/status', (req, res) => {
  res.json({ message: "Codex Lab backend is live." });
});

app.listen(PORT, () => {
  console.log(`Backend running at http://localhost:${PORT}`);
});
