{% if theme.utterances.enable %}
  <script src="https://utteranc.es/client.js"
    repo="{{ theme.utterances.repo }}"
    issue-term="{{ theme.utterances.issue_term }}"
    label="{{ theme.utterances.label }}"
    theme="{{ theme.utterances.theme }}"
    crossorigin="anonymous"
    async>
  </script>
{% endif %}
