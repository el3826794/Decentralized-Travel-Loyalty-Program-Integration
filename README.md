# Decentralized Travel Loyalty Program

A blockchain-based loyalty program for the travel industry built with Clarity smart contracts.

## Overview

This project implements a decentralized travel loyalty program that allows travel service providers to issue and manage loyalty points. Customers can earn points through various activities and redeem them for rewards across the network of participating providers.

## Smart Contracts

The system consists of five main contracts:

1. **Travel Provider Verification**: Validates and manages travel service providers in the network.
2. **Loyalty Points**: Manages the fungible token representing loyalty points.
3. **Partner Integration**: Handles integration with loyalty program partners.
4. **Redemption Management**: Manages the redemption of loyalty points for rewards.
5. **Customer Analytics**: Tracks and analyzes customer behavior and activities.

## Contract Interactions

\`\`\`
┌─────────────────────┐      ┌─────────────────────┐
│                     │      │                     │
│  Travel Provider    │<─────│  Partner            │
│  Verification       │      │  Integration        │
│                     │      │                     │
└─────────┬───────────┘      └─────────┬───────────┘
│                            │
│                            │
▼                            ▼
┌─────────────────────┐      ┌─────────────────────┐
│                     │      │                     │
│  Loyalty Points     │<─────│  Redemption         │
│                     │      │  Management         │
│                     │      │                     │
└─────────┬───────────┘      └─────────┬───────────┘
│                            │
│                            │
└────────────┬───────────────┘
│
▼
┌─────────────────────┐
│                     │
│  Customer           │
│  Analytics          │
│                     │
└─────────────────────┘
\`\`\`

## Features

- **Provider Verification**: Only verified travel providers can participate in the program.
- **Fungible Token**: Loyalty points implemented as a fungible token.
- **Partner Management**: Add and manage loyalty program partners with custom conversion rates.
- **Redemption Options**: Create and manage various redemption options for customers.
- **Customer Insights**: Track customer activities and analyze behavior patterns.

## Getting Started

### Prerequisites

- Clarity CLI
- A Stacks blockchain node (for deployment)

### Installation

1. Clone the repository
2. Deploy the contracts in the following order:
    - Travel Provider Verification
    - Loyalty Points
    - Partner Integration
    - Redemption Management
    - Customer Analytics

### Usage

After deployment, initialize the system by:

1. Verifying travel providers
2. Adding redemption options
3. Adding activity types for analytics
4. Authorizing contracts to interact with each other

## Testing

Run the tests using Vitest:

\`\`\`bash
npm test
\`\`\`

## License

This project is licensed under the MIT License - see the LICENSE file for details.

