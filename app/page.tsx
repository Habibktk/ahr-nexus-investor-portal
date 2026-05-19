export default function Home() {
  return (
    <main style={{ minHeight: "100vh", background: "#020617", color: "white", padding: "30px" }}>
      <p style={{ border: "1px solid white", display: "inline-block", padding: "6px 12px", borderRadius: "20px" }}>
        Secure Investor Profit Tracking Portal
      </p>

      <h1 style={{ fontSize: "42px", marginTop: "40px" }}>
        AHR Nexus Investor Portal
      </h1>

      <p style={{ fontSize: "20px", maxWidth: "600px" }}>
        Professional dashboard for capital, profit, withdrawals, monthly ROI reports,
        investment timeline, and admin updates.
      </p>

      <div style={{ marginTop: "30px", display: "flex", gap: "15px", flexWrap: "wrap" }}>
        <button style={{ background: "#22c55e", padding: "15px 30px", borderRadius: "16px", fontSize: "18px", fontWeight: "bold" }}>
          Investor Login
        </button>

        <button style={{ background: "#111827", color: "white", padding: "15px 30px", borderRadius: "16px", fontSize: "18px", border: "1px solid #334155" }}>
          Admin Panel
        </button>
      </div>
    </main>
  );
}
