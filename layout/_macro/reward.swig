{% if theme.alipay or theme.wechatpay %}
  <div class="reward-container">
    <button onclick="var qr = document.getElementById('qr'); qr.style.display = (qr.style.display === 'none') ? 'block' : 'none';">
      <span>赞赏支持</span>
    </button>
    <div id="qr" style="display: none;">
      {% if theme.wechatpay %}
        <div id="wechat" style="display: inline-block">
          <img id="wechat_qr" src="{{ theme.wechatpay }}" alt="{{ theme.author }} WeChat Pay"/>
          <p>微信扫一扫</p>
        </div>
      {% endif %}
      {% if theme.alipay %}
        <div id="alipay" style="display: inline-block">
          <img id="alipay_qr" src="{{ theme.alipay }}" alt="{{ theme.author }} Alipay"/>
          <p>支付宝扫一扫</p>
        </div>
      {% endif %}
    </div>
  </div>
{% endif %}
