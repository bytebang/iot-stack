module.exports = {
    flowFile: 'flows.json',
    // false = Credentials im Klartext in flows_cred.json (ermöglicht Vorkonfiguration per ${ENV})
    credentialSecret: false,
    flowFilePretty: true,
    uiPort: process.env.PORT || 1880,
    // Editor-Login: auskommentieren und Hash mit "node-red admin hash-pw" erzeugen
    // adminAuth: {
    //     type: "credentials",
    //     users: [{ username: "admin", password: "$2b$08$...", permissions: "*" }]
    // },
    diagnostics: { enabled: false },
    logging: { console: { level: "info", metrics: false, audit: false } },
    editorTheme: { projects: { enabled: false } },
    functionGlobalContext: {}
};
