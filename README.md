# Proposal Hub

A decentralized platform for submitting and voting on community proposals using blockchain technology.

## Overview

Proposal Hub enables community members to submit proposals and gather support in a transparent, immutable way. The system ensures that each community member can only support one proposal at a time, maintaining voting integrity while providing clear metrics on proposal popularity.

## Features

- **Proposal Submission**: Any community member can submit a new proposal
- **Transparent Support**: All support for proposals is recorded on the blockchain
- **One Vote Per Member**: Each community member can only support one proposal at a time
- **Support Tracking**: Real-time tracking of support counts for each proposal
- **Proposal Statistics**: Easy access to proposal counts and support metrics

## Functions

### Public Functions

- `submit-proposal`: Submit a new community proposal
- `support-proposal`: Add your support to an existing proposal

### Read-Only Functions

- `get-support-count`: View the total support for a specific proposal
- `has-supported`: Check if a community member has already supported a proposal
- `get-proposal-count`: Get the total number of proposals submitted
- `compare-max`: Utility function to compare two values

## Getting Started

1. Deploy the contract to your blockchain
2. Community members can begin submitting proposals
3. Members can support proposals they believe in
4. Track proposal support to identify community priorities

## Use Cases

- Community governance decisions
- Feature prioritization for projects
- Resource allocation voting
- Initiative selection for funding

## Security

The system ensures voting integrity by limiting each member to supporting only one proposal at a time, preventing vote manipulation.
